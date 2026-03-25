#!/bin/bash
set -euo pipefail

APP_DIR="/opt/app/app"
BACKUP_DIR="/opt/backup"
TIMESTAMP=$(date +%Y%m%d-%H%M%S)
TMP_DIR="${BACKUP_DIR}/tmp-${TIMESTAMP}"
ARCHIVE_NAME="backup-${TIMESTAMP}.tar.gz"
LOG_FILE="${BACKUP_DIR}/backup-${TIMESTAMP}.log"

# Function for logging
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOG_FILE"
}

log "Starting backup process..."

mkdir -p "$TMP_DIR"

cd "$APP_DIR"

# Load environment variables
if [ ! -f .env ]; then
    log "ERROR: .env file not found in $APP_DIR"
    exit 1
fi
source .env

if [ ! -f /opt/backup/.env ]; then
    log "ERROR: /opt/backup/.env file not found"
    exit 1
fi
source /opt/backup/.env

# Validate required variables
if [ -z "${BACKUP_BUCKET:-}" ]; then
    log "ERROR: BACKUP_BUCKET is not set"
    exit 1
fi

if [ -z "${MYSQL_ROOT_PASSWORD:-}" ]; then
    log "ERROR: MYSQL_ROOT_PASSWORD is not set"
    exit 1
fi

log "Database backup..."
if ! docker compose exec -T mysql sh -c "mysqldump -u root -p${MYSQL_ROOT_PASSWORD} --databases UserDB" > "${TMP_DIR}/db.sql"; then
    log "ERROR: Database dump failed"
    exit 1
fi
log "Database dump completed successfully"

log "Creating archive..."
if ! tar -czf "${BACKUP_DIR}/${ARCHIVE_NAME}" \
  .env \
  docker-compose.yml \
  nginx/default.conf \
  mysql/init.sql \
  monitoring \
  -C "$TMP_DIR" db.sql; then
    log "ERROR: Archive creation failed"
    exit 1
fi
log "Archive created: ${ARCHIVE_NAME}"

# Verify archive exists and has content
if [ ! -s "${BACKUP_DIR}/${ARCHIVE_NAME}" ]; then
    log "ERROR: Archive file is empty or does not exist"
    exit 1
fi

log "Uploading to S3..."
if aws s3 cp "${BACKUP_DIR}/${ARCHIVE_NAME}" "s3://${BACKUP_BUCKET}/${ARCHIVE_NAME}"; then
    log "✅ Successfully uploaded to s3://${BACKUP_BUCKET}/${ARCHIVE_NAME}"
else
    log "❌ ERROR: Failed to upload to S3"
    log "Checking AWS credentials and S3 bucket..."
    aws sts get-caller-identity >> "$LOG_FILE" 2>&1 || log "ERROR: AWS credentials not configured"
    exit 1
fi

log "Cleaning up old backups (older than 3 days)..."
find "${BACKUP_DIR}" -type f -name "backup-*.tar.gz" -mtime +3 -delete

rm -rf "$TMP_DIR"

log "✅ Backup completed successfully: ${ARCHIVE_NAME}"