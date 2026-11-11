# hap_launcher

Orquestación Docker para DigitalOcean. Los servicios viven como submódulos git.

```bash
git clone --recurse-submodules git@github.com:phuenchullan/hap_launcher.git
cd hap_launcher
cp .env.example .env
nano .env
./scripts/prepare-data.sh
docker compose build
docker compose up -d
```

Los datos de Postgres y las fotos AVIF quedan en disco local:

- `data/gateway` — base del gateway
- `data/harvest` — base de harvest-ms
- `data/hap-files` — base de hap-files
- `data/images` — archivos AVIF

Respaldo:

```bash
./scripts/backup-data.sh
```

El archivo queda en `backups/`. Copia esa carpeta fuera del droplet.

Actualizar código:

```bash
git pull
git submodule update --init --recursive
docker compose build
docker compose up -d
```
