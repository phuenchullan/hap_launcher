#!/usr/bin/env sh
set -eu

ROOT="$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

mkdir -p data/gateway data/harvest data/hap-files data/images nginx/certs

chmod 777 data/gateway data/harvest data/hap-files data/images

if [ "$(id -u)" -eq 0 ]; then
  chown -R 70:70 data/gateway data/harvest data/hap-files
  chown -R 1000:1000 data/images
fi
