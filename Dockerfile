# ── Stage 1: builder ──────────────────────────────────────
FROM python:3.12-slim AS builder

WORKDIR /app

# Instalar deps en una carpeta específica
COPY src/requirements.txt .
RUN pip install --target=/app/deps -r requirements.txt

# ── Stage 2: imagen final ──────────────────────────────────
FROM python:3.12-slim

# Crear usuario no-root — nunca correr como root en producción
RUN useradd --create-home appuser

WORKDIR /app

# Copiar SOLO las deps instaladas del stage anterior
COPY --from=builder /app/deps ./deps

# Copiar el código
COPY src/ .

# Cambiar al usuario sin privilegios
USER appuser

EXPOSE 8080

ENV PYTHONPATH=/app/deps

CMD ["python", "app.py"]
