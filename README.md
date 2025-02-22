# Platform SM (!В РАЗРАБОТКЕ!)

Platform SM - это инструмент для быстрой разработки и развертывания проектов, который включает в себя все необходимые
компоненты для создания полноценных веб-приложений. С помощью **Platform SM** мы можем легко и быстро настроить весь
стек технологий и сразу приступить к разработке, минимизируя время на настройку инфраструктуры и интеграцию различных
сервисов.

## 🚀 Быстрая настройка и развертывание

### 1. Шаблон для быстрого старта:

Проект **Platform SM** имеет заранее подготовленный шаблон, который включает в себя базовую структуру для различных
типов приложений: веб-приложений на Laravel + React, мобильных приложений на React Native, панелей администратора и
сервисов с GraphQL API.

Всё, что нам нужно сделать, это выполнить несколько команд в терминале, и проект будет готов к запуску.

### 2. Автоматизированный скрипт для создания нового проекта:

Скрипт `create-new-project.sh` позволяет с минимальными усилиями создать новый проект с нужной конфигурацией и
структурой. После его выполнения все необходимые сервисы (Docker, Redis, PostgreSQL и т.д.) будут настроены и готовы к
работе.

### 3. Контейнеризация с Docker:

Проект настроен с использованием **Docker**, что позволяет нам не тратить время на настройку окружений и зависимостей.
Всё работает из коробки: настроены контейнеры для базы данных (PostgreSQL), кеширования (Redis), очередей (Redis), а
также для веб-сокетов, которые обеспечат обмен данными в реальном времени.

### 4. Готовые решения для различных сервисов:

Для backend-разработки мы используем **Laravel (PHP)**, а для работы с real-time функциональностью - **Node.js** с
сервером веб-сокетов. В frontend-части использованы **React & React Admin** для веба и **React Native** для мобильных
приложений. Мы получаем всё необходимое для создания интерфейсов и взаимодействия с API, без необходимости настраивать
все с нуля.

### 5. Гибкость и масштабируемость:

Платформа поддерживает масштабируемую архитектуру, благодаря использованию микросервисов и контейнеризации. Если нам
потребуется масштабировать проект, мы легко сможем добавить новые сервисы или компоненты, не нарушая текущую
инфраструктуру. Допустим внедрение искусственного интеллекта.

## 🛠 Преимущества подхода

- **Быстрота старта**: Простой процесс настройки и развертывания, который занимает минимум времени.
- **Отсутствие необходимости в настройке окружений**: Все сервисы уже настроены для работы в контейнерах Docker.
- **Масштабируемость**: Легко добавляем новые сервисы, компоненты или микросервисы без дополнительных усилий.
- **Готовность к реальному времени**: Сервер веб-сокетов настроен для доставки данных в реальном времени.

## Документация

Для более детального понимания платформы и ее компонентов, пожалуйста, ознакомьтесь с следующими документами:

- **[Domain-Driven Design (DDD)](doc/DomainDrivenDesign.md)**: Описание предметной области и доменных слоев
  платформы.
- **[System Analysis & Design](doc/SystemAnalysisDesign.md)**: Анализ системных требований и архитектурный
  дизайн платформы.
- **[System Architecture](doc/SystemArchitecture.md)**: Архитектура платформы.

## 📌 Структура проекта

```
platform-sm/
│── template/ # Шаблон проекта для быстрого старта
│── packages/
│ ├── laravel/        # Backend на Laravel (бизнес-логика, очереди)
│ ├── react-app/      # Frontend на React
│ ├── react-admin/    # Панель администратора на React
│ ├── react-native/   # Мобильные приложения React Native
│ ├── websocket/      # Сервер WebSocket для реального времени (Node.js)
│ ├── graphql-api/    # GraphQL API на Node.js (Apollo, Hasura и т.д.)
│── create-new-project.sh # Скрипт для создания нового проекта

```

## 🛠 Используемые технологии

- **Backend**: PHP (Laravel/REST API), Node.js, AI-API, Websocket
- **Frontend**: React, React Admin, TypeScript, React Native
- **API**: GraphQL
- **База данных**: PostgreSQL (pgsql)
- **Кеширование**: Redis
- **Администрирование БД**: pgAdmin
- **Инструменты для работы с Redis**: Redis Commander
- **Контейнеризация**: Docker

## 🚀 Создание нового проекта

Для создания нового проекта выполняем команду:

```
./create-new-project.sh my-new-project
```

## 🛠️ Установка и запуск

1. Клонируем репозиторий:

```
   git clone https://github.com/smetaniny/platform-sm.git
   cd platform-sm
```

2. Создаем новый проект:

```
   ./create-new-project.sh my-new-project
```

3. Переходим в директорию проекта и запускаем Docker-контейнеры:

```
   cd my-new-project
   docker-compose up -d
```
