FROM python:3.9-alpine

# Копируем файл зависимостей
COPY requirements.txt /temp/requirements.txt
# Копируем папку с приложением
COPY app /app
# Назначаем деррикторию workdir
WORKDIR /app
# Указываем порт для нашего приложения (gunicorn)
EXPOSE 8000
# Устанавливаем зависимости
RUN pip install -r /temp/requirements.txt
# Создаем пользователя
RUN adduser  --disabled-password app-user
# Меняем пользлвателя
USER app-user
