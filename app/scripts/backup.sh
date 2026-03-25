#!/bin/bash
set -euo pipefail

APP_DIR="/opt/app/app"
BACKUP_DIR="/opt/backup"
TIMESTAMP=$(date +%Y%m%d-%H%M%S)
TMP_DIR="${BACKUP_DIR}/tmp-${TIMESTAMP}"
ARCHIVE_NAME="backup-${TIMESTAMP}.tar.gz"

mkdir -p "$TMP_DIR"

cd "$APP_DIR"

source .env
source /opt/backup/.env

docker compose exec -T mysql sh -c "mysqldump -u root -p${MYSQL_ROOT_PASSWORD} --databases UserDB" > "${TMP_DIR}/db.sql"

tar -czf "${BACKUP_DIR}/${ARCHIVE_NAME}" \
  .env \
  docker-compose.yml \
  nginx/default.conf \
  mysql/init.sql \
  monitoring \
  -C "$TMP_DIR" db.sql

aws s3 cp "${BACKUP_DIR}/${ARCHIVE_NAME}" "s3://${BACKUP_BUCKET}/${ARCHIVE_NAME}"

find "${BACKUP_DIR}" -type f -name "backup-*.tar.gz" -mtime +3 -delete
rm -rf "$TMP_DIR"

echo "Backup completed: ${ARCHIVE_NAME}"