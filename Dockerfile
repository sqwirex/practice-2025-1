# Dockerfile (в корне site-for-mpu)
FROM python:3.10-slim

# где внутри контейнера будет лежать бот
WORKDIR /app/telegram-wordly-bot

# копируем только .env и pip‑зависимости первым слоем
COPY telegram-wordly-bot/.env ./
COPY telegram-wordly-bot/requirements.txt ./

# ставим зависимости
RUN pip install --no-cache-dir -r requirements.txt

# копируем весь код бота
COPY telegram-wordly-bot/ ./

# запускаем бота
CMD ["python", "bot.py"]
