# Описание архитектуры системы Platform SM

## 📌 [Диаграмма архитектуры](./SystemArchitecture.png)

## 1. Общий обзор архитектуры

Система **Platform SM** построена на основе **микросервисной архитектуры**, где каждый компонент отвечает за свою
задачу. Основные компоненты системы:

- **Веб-приложение (React):** Интерфейс для пользователей.
- **Мобильное приложение (React Native):** Интерфейс для мобильных пользователей.
- **Панель администратора (React Admin):** Интерфейс для администраторов.
- **REST API (Laravel):** API для управления проектами, пользователями и конфигурациями.
- **GraphQL API (Node.js):** Основной API для обработки запросов от веб- и мобильного приложений.
- **WebSocket сервер (Node.js):** Сервер для обмена данными в реальном времени.
- **База данных (PostgreSQL):** Хранение структурированных данных.
- **Redis:** Кеширование данных и управление очередями задач.

## 2. Ключевые компоненты и их взаимодействие

### 2.1 Пользователь и клиенты

- **Пользователь:** Взаимодействует с системой через веб-приложение, мобильное приложение и панель администратора.
- **Веб-приложение (React):** Интерфейс для пользователей, который взаимодействует с **GraphQL API** и **WebSocket
  сервером**.
- **Мобильное приложение (React Native):** Интерфейс для мобильных пользователей, который взаимодействует с **GraphQL
  API** и **WebSocket сервером**.
- **Панель администратора (React Admin):** Интерфейс для администраторов, который взаимодействует с **REST API**.

### 2.2 REST API (Laravel)

- **Назначение:** Управление проектами, пользователями и конфигурациями системы.
- **Взаимодействие:**
    - Получает запросы от **панели администратора**.
    - Взаимодействует с **базой данных (PostgreSQL)** для чтения и записи данных.
    - Использует **Redis** для кеширования и управления очередями задач.
    - Отправляет события в **WebSocket сервер** для уведомлений в реальном времени.

### 2.3 GraphQL API (Node.js)

- **Назначение:** Основной API для обработки запросов от веб- и мобильного приложений.
- **Взаимодействие:**
    - Получает запросы от **веб-приложения** и **мобильного приложения**.
    - Взаимодействует с **базой данных (PostgreSQL)** для чтения и записи данных.
    - Использует **Redis** для кеширования данных и управления очередями задач.

### 2.4 WebSocket сервер (Node.js)

- **Назначение:** Обеспечивает обмен данными в реальном времени между клиентами и системой.
- **Взаимодействие:**
    - Получает события от **REST API (Laravel)**.
    - Отправляет уведомления в реальном времени **веб-приложению**, **мобильному приложению** и **панели администратора
      **.

### 2.5 База данных (PostgreSQL)

- **Назначение:** Хранение структурированных данных, таких как проекты, пользователи и настройки.
- **Взаимодействие:**
    - **REST API (Laravel)** и **GraphQL API (Node.js)** взаимодействуют с базой данных для чтения и записи данных.

### 2.6 Redis

- **Назначение:** Кеширование часто запрашиваемых данных и управление очередями задач.
- **Взаимодействие:**
    - Используется **REST API (Laravel)** и **GraphQL API (Node.js)** для кеширования данных и управления очередями.

## 3. Взаимодействие компонентов

### 3.1 Взаимодействие через API

- **Веб-приложение** и **мобильное приложение** взаимодействуют с **GraphQL API** для получения данных.
- **Панель администратора** взаимодействует с **REST API** для управления проектами и пользователями.

### 3.2 Взаимодействие с базой данных

- **REST API (Laravel)** и **GraphQL API (Node.js)** взаимодействуют с **PostgreSQL** для хранения и извлечения данных.

### 3.3 Взаимодействие с Redis

- **REST API (Laravel)** и **GraphQL API (Node.js)** используют **Redis** для кеширования данных и управления очередями
  задач.

### 3.4 Взаимодействие с WebSocket сервером

- **REST API (Laravel)** отправляет события в **WebSocket сервер**, который, в свою очередь, отправляет уведомления
  клиентам в реальном времени.

## 4. Преимущества архитектуры

1. **Масштабируемость:**
    - Каждый компонент системы может масштабироваться независимо.
    - Например, **GraphQL API** и **WebSocket сервер** могут быть развернуты на отдельных серверах для обработки высокой
      нагрузки.

2. **Гибкость:**
    - Использование **GraphQL API** позволяет клиентам запрашивать только те данные, которые им нужны.
    - **REST API** обеспечивает простоту интеграции с панелью администратора.

3. **Надежность:**
    - Использование **Redis** для кеширования и управления очередями задач повышает производительность системы.
    - **WebSocket сервер** обеспечивает надежную доставку уведомлений в реальном времени.

4. **Удобство поддержки:**
    - Разделение на микросервисы упрощает разработку, тестирование и поддержку системы.

## 5. Заключение

Архитектура системы **Platform SM** построена на основе микросервисов, что обеспечивает **масштабируемость**, **гибкость
** и **надежность**. Ключевые компоненты системы взаимодействуют через четко определенные интерфейсы (API), что упрощает
разработку и поддержку. Использование **PostgreSQL**, **Redis** и **WebSocket сервера** позволяет эффективно управлять
данными и обеспечивать обмен информацией в реальном времени.
