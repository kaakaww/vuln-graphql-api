FROM node:14-buster

ARG SERVER_PORT=3000
ENV SERVER_PORT=${SERVER_PORT}
EXPOSE ${SERVER_PORT}:${SERVER_PORT}

RUN apt update && apt upgrade -y
RUN useradd -m app
COPY --chown=app ./app /graphql
COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
WORKDIR /graphql

RUN sed -i'' -e "s/%SERVER_PORT%/${SERVER_PORT}/g" /graphql/app.ts
RUN npm install sqlite3
RUN npm install
RUN npm run tsc
RUN npm run sequelize db:migrate
RUN npm run sequelize db:seed:all
RUN chown app /graphql

USER app
ENTRYPOINT [ "docker-entrypoint.sh" ]
