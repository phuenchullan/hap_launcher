#!/usr/bin/env sh
set -eu

ROOT="$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

mkdir -p backups
STAMP="$(date +%Y%m%d-%H%M%S)"
ARCHIVE="backups/hap-data-$STAMP.tar.gz"

docker compose stop gateway-db harvest-db hap-files-db hap-files || true
tar -czf "$ARCHIVE" data
docker compose start gateway-db harvest-db hap-files-db hap-files || true

echo "Respaldo creado: $ARCHIVE"
