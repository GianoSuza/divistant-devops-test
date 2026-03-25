#!/bin/bash
set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Usage: $0 <backup-file.tar.gz>"
  exit 1
fi

BACKUP_FILE="$1"
RESTORE_DIR="/opt/backup/restore-$(date +%s)"
LOG_FILE="/opt/backup/restore-$(date +%Y%m%d-%H%M%S).log"

# Function for logging
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOG_FILE"
}

log "Starting restore process..."
log "Backup file: $BACKUP_FILE"

# Validate backup file exists
if [ ! -f "$BACKUP_FILE" ]; then
    log "ERROR: Backup file not found: $BACKUP_FILE"
    exit 1
fi

mkdir -p "$RESTORE_DIR"
log "Extracting backup..."
if ! tar -xzf "$BACKUP_FILE" -C "$RESTORE_DIR"; then
    log "ERROR: Failed to extract backup file"
    exit 1
fi
log "Backup extracted to $RESTORE_DIR"

cd /opt/app/divistant-devops-test/app
log "Changed directory to $(pwd)"

# Load environment variables
if [ ! -f .env ]; then
    log "ERROR: .env file not found"
    exit 1
fi
source .env
log "Environment variables loaded"

log "Restoring database..."
# Use same password approach as backup.sh with proper quoting
if ! docker compose -f /opt/app/divistant-devops-test/app/docker-compose.yml exec -T mysql mysql -u root -p"StrongRootPass123!" UserDB < "${RESTORE_DIR}/db.sql"; then
    log "ERROR: Database restore failed"
    rm -rf "$RESTORE_DIR"
    exit 1
fi

log "✅ Database restored successfully"

# Cleanup
rm -rf "$RESTORE_DIR"
log "✅ Restore completed successfully"
