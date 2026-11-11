#!/usr/bin/env sh
set -eu

ROOT="$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

mkdir -p data/gateway data/harvest data/hap-files data/images

if [ "$(id -u)" -eq 0 ]; then
  chown -R 70:70 data/gateway data/harvest data/hap-files
  chown -R 10001:10001 data/images
else
  echo "Directorios listos en $ROOT/data"
  echo "Si Postgres no puede escribir, ejecuta:"
  echo "  sudo chown -R 70:70 data/gateway data/harvest data/hap-files"
  echo "  sudo chown -R 10001:10001 data/images"
fi
