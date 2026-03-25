#!/bin/bash
set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Usage: $0 <backup-file.tar.gz>"
  exit 1
fi

BACKUP_FILE="$1"
RESTORE_DIR="/opt/backup/restore"

mkdir -p "$RESTORE_DIR"
tar -xzf "$BACKUP_FILE" -C "$RESTORE_DIR"

cd /opt/app/app
source .env

docker compose exec -T mysql sh -c "mysql -u root -p${MYSQL_ROOT_PASSWORD}" < "${RESTORE_DIR}/db.sql"

echo "Restore completed"
