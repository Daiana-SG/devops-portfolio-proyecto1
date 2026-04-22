# Proyecto 1 — API Flask con CI/CD

API REST en Flask con pipeline CI/CD automatizado usando GitHub Actions y Docker Hub.

## Stack

- Python + Flask
- Docker multi-stage build
- Docker Compose (app + PostgreSQL)
- GitHub Actions

## Pipeline CI/CD

Cada push a `main` dispara automáticamente:

1. Build de la imagen Docker
2. Push a Docker Hub con dos tags:
   - `latest` — siempre apunta al último build
   - `<sha>` — trazabilidad exacta del commit

## Endpoints

| Método | Ruta | Descripción |
|--------|------|-------------|
| GET | `/` | Mensaje de bienvenida |
| GET | `/health` | Health check |

## Correr localmente

```bash
cp .env.example .env
docker compose up
```

## Imagen pública

`docker pull dmsgiordano/devops-portfolio-proyecto1:latest`
