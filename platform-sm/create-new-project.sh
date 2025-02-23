#!/bin/bash

# Проверяем, передано ли имя проекта
if [ -z "$1" ]; then
  echo "❌ Использование: ./create-new-project.sh <название_проекта>"
  exit 1
fi

PROJECT_NAME=$1
PROJECT_PATH="./$PROJECT_NAME"

echo "🚀 Создаём новый проект: $PROJECT_NAME..."

# 1. Копируем шаблон проекта в новую папку
cp -r ./template "$PROJECT_PATH"

# 2. Переходим в директорию нового проекта
cd "$PROJECT_PATH" || exit

# 3. Инициализируем новый репозиторий Git
git init
git add .  # Добавляем все файлы в репозиторий
git commit -m "Initial commit"  # Делаем первый коммит

# 4. Копируем ENV-файл и заменяем имя проекта
cp .env.example .env
sed -i "s/PROJECT_NAME/$PROJECT_NAME/g" .env

# 5. Запускаем Docker-контейнеры
echo "🐳 Запускаем Docker..."
docker-compose up -d

echo "✅ Проект $PROJECT_NAME создан и запущен! Доступен по адресу http://$PROJECT_NAME.local"
