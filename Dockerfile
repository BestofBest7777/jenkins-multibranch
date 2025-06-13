# 1. Используем современный образ Node.js
FROM node:16

# 2. Устанавливаем рабочую директорию
WORKDIR /app

# 3. Копируем package.json и устанавливаем зависимости отдельно (кэширование!)
COPY package*.json ./
RUN npm install

# 4. Получаем порт из Jenkins (build-arg) и пробрасываем в окружение
ARG APP_PORT
ENV PORT=$APP_PORT
ENV REACT_APP_PORT=$APP_PORT

# 5. Копируем остальные файлы проекта
COPY . .

# 6. Открываем порт
EXPOSE $PORT

# 7. Запуск приложения
CMD ["npm", "start"]

