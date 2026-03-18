FROM python:3.11-alpine3.20
WORKDIR /code
COPY requirements.txt .
RUN apk add --no-cache musl-dev mariadb-connector-c-dev gcc
RUN pip install --no-cache-dir --upgrade -r requirements.txt
COPY . .
CMD ["fastapi", "run", "app/main.py", "--port", "80", "--workers", "4"]
