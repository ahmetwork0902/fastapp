FROM tiangolo/uvicorn-gunicorn-fastapi:python3.9

# Установка Nginx
RUN apt-get update && apt-get install -y nginx

# Копирование файлов конфигурации и статических файлов
COPY ./app /app
COPY ./static /app/static
COPY ./nginx.conf /etc/nginx/nginx.conf

# Установка зависимостей
RUN pip install --no-cache-dir sqlalchemy psycopg2

# Запуск Nginx и сервера FastAPI
CMD service nginx start && uvicorn main:app --host 0.0.0.0 --port 80
