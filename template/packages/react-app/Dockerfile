ARG NODE_VERSION=20
ARG CLIENT_PORT=3001

FROM node:$NODE_VERSION-buster as base

WORKDIR /app

# Устанавливаем зависимости проекта, включая lerna
COPY package.json ./
RUN yarn install --frozen-lockfile

FROM base as builder

# Копируем весь проект
COPY . .

# Используем локальную версию lerna для выполнения bootstrap
RUN ./node_modules/.bin/lerna bootstrap

# Строим проект с указанным scope
RUN rm -rf /app/packages/react-app/dist/ && yarn build --scope=react-app

FROM nginx:latest as production
WORKDIR /app

# Копируем билд из контейнера builder
COPY --from=builder /app/packages/react-app/dist/ /app/
COPY --from=builder /app/packages/react-app/nginx.conf /etc/nginx/nginx.conf

EXPOSE $CLIENT_PORT
CMD [ "nginx", "-g", "daemon off;" ]
