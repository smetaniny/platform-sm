### Как запускать?

1. Убедитесь что у вас установлен `node` и `docker`
2. Запустите `docker`
3. Выполните команду `lerna exec -- yarn install` - это обязательный шаг, без него ничего работать не будет :)
4. Соберите проект `yarn docker:build или lerna run build --scope=react-app`
5. Для запуска в режиме development `yarn docker:dev`
6. Для запуска в режиме production `yarn docker:up`

yarn workspace reactNative start --reset-cache
yarn workspace reactNative run android
yarn workspace reactNative install
yarn workspace reactNative exec pod install

docker-compose down
docker-compose up -d --build

## Запуск подсистемы Windows для Linux (WSL)

Для использования команд Docker в WSL с окружением Ubuntu:

````bash
wsl -d Ubuntu


# Остановка Docker

## Остановка и удаление всех контейнеров и связанных с ними сетей

```bash
docker-compose down
# Останавливаем все контейнеры и сети
````

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
