yarn workspace reactNative start --reset-cache
yarn workspace reactNative run android
yarn workspace reactNative install
yarn workspace reactNative exec pod install

## Запуск подсистемы Windows для Linux (WSL)

Для использования команд Docker в WSL с окружением Ubuntu:

```bash
wsl -d Ubuntu
# Запускаем WSL с Ubuntu
```

## Переход в каталог с вашим проектом Laravel

Перейдите в корневую папку вашего проекта:

```bash
cd /mnt/e/domains.loc/smetaniny
# Переходим в директорию проекта Laravel
```

## Запуск контейнеров Docker

Запускает контейнеры Docker, необходимые для работы вашего приложения Laravel. Флаг `-d` запускает контейнеры в фоновом режиме:

```bash
./vendor/bin/sail up -d
# Запускаем контейнеры в фоновом режиме
```

## Проверка запущенных контейнеров

Команда для просмотра списка запущенных контейнеров:

```bash
docker ps
# Проверяем, что контейнеры запущены
```

## Установка Sail в проект

Эта команда создает файл `docker-compose.yml`, который управляет контейнерами:

```bash
php artisan sail:install
# Устанавливаем Sail в проект для управления Docker контейнерами
```

## Перезапуск контейнеров с последними изменениями

Перезапускает контейнеры с учетом последних изменений в `docker-compose.yml`:

```bash
./vendor/bin/sail up
# Перезапускаем контейнеры, если изменили конфигурацию
```

## Выполнение миграции базы данных

Миграции базы данных для вашего приложения Laravel:

```bash
./vendor/bin/sail artisan migrate
# Запускаем миграции для базы данных
```

# Очистка кэша Laravel

## Очистка конфигурационного кэша

```bash
./vendor/bin/sail artisan config:clear
# Очищаем конфигурационный кэш
```

## Очистка всех видов кэша (например, представления)

```bash
./vendor/bin/sail artisan cache:clear
# Очищаем общий кэш
```

# Управление контейнерами

## Остановка контейнеров и сохранение данных в томах

```bash
./vendor/bin/sail down --volumes
# Останавливаем контейнеры и сохраняем данные
```

## Подключение к базе данных PostgreSQL из контейнера

```bash
./vendor/bin/sail exec pgsql psql -U sail -d laravel
# Подключаемся к базе данных PostgreSQL
```

## Перезапуск службы Docker

```bash
sudo systemctl restart docker
# Перезапускаем Docker, если есть проблемы
```

# Остановка Docker

## Остановка и удаление всех контейнеров и связанных с ними сетей

```bash
docker-compose down
# Останавливаем все контейнеры и сети
```

## Дополнительно удаляет тома (данные контейнеров) и образы Docker

```bash
docker-compose down --volumes --rmi all
# Удаляем контейнеры, тома и образы
```

# Lerna

## Инициализация нового проекта npm

```bash
npm init -y
# Инициализируем новый проект npm
```

## Установка Lerna глобально или локально в ваш проект

```bash
npm install --global lerna
npm install --save-dev lerna
# Устанавливаем Lerna для управления монорепозиторием
```

## Инициализация Lerna

```bash
npx lerna init
# Инициализируем Lerna в проекте
```

## Создание React Admin в пакете `frontend`

### С использованием create-react-app

```bash
npx create-react-app frontend --template typescript
cd frontend
npm install react-admin ra-data-simple-rest
# Создаем фронтенд с использованием React и подключаем react-admin
```

### С использованием Vite

```bash
npm create vite@latest frontend -- --template react-ts
cd frontend
npm install react-admin ra-data-simple-rest
# Используем Vite для быстрого создания фронтенда
```

## Обновление вашего `docker-compose.yml` для включения фронтенда

```yaml
services:
frontend:
build:
context: ./packages/frontend
dockerfile: Dockerfile
ports:
  - "${FRONTEND_PORT:-3000}:3000"
volumes:
  - "./packages/frontend:/app"
networks:
  - sail
depends_on:
  - laravel.test
# Добавляем фронтенд в docker-compose.yml
```

## Создание Dockerfile для фронтенда в `packages/frontend/Dockerfile`

```Dockerfile
FROM node:18
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
CMD ["npm", "run", "dev"]
# Создаем Dockerfile для фронтенд-приложения
```

## Обновление `lerna.json` для использования независимой версии пакетов

```json
{
"packages": ["packages/*"],
"version": "independent"
}
# Устанавливаем независимую версию пакетов для Lerna
```

## Запуск всего проекта с помощью Docker Compose

```bash
docker-compose up -d
# Запускаем проект с помощью Docker Compose
```

## Запуск миграций

```bash
docker-compose exec laravel php artisan migrate --force
docker-compose exec laravel php artisan config:clear
docker-compose exec laravel php artisan cache:clear
docker-compose exec laravel php artisan config:cache
docker-compose exec laravel php artisan tinker
# Запускаем миграции и очищаем кэш
```

# PGAdmin

## Открытие PGAdmin в браузере

```bash
http://smetaniny:8080
# Открываем PGAdmin в браузере
```

## Авторизация в PGAdmin

Используйте логин и пароль, указанные в переменных окружения для сервиса `pgadmin`:

- `PGADMIN_DEFAULT_EMAIL`: admin@example.com
- `PGADMIN_DEFAULT_PASSWORD`: 123456

## Добавление нового сервера в PGAdmin

1. В интерфейсе PGAdmin нажмите правой кнопкой мыши на "Servers" → "Create" → "Server..."
2. Во вкладке General задайте имя (например, `LaravelDB`).
3. Перейдите на вкладку Connection и заполните поля:
   - Host name/address: pgsql (или localhost, если проброс портов настроен правильно)
   - Port: 5432
   - Maintenance database: laravel
   - Username: sail
   - Password: password

# Добавляем сервер в PGAdmin

````

# Автоматизация

## Создание скрипта `create-new-project.sh`
Скрипт, который будет копировать нужные файлы и запускать всё одной командой. В нем можно автоматизировать процесс создания проекта и настройки Docker.

```bash
#!/bin/bash
# Пример создания нового проекта с автоматическим запуском
````
