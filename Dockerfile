FROM python:3.12-slim

WORKDIR /app

# Primero las deps (se cachean)
COPY src/requirements.txt .
RUN pip install -r requirements.txt

# Después el código
COPY src/ .

EXPOSE 8080

CMD ["python", "app.py"]
