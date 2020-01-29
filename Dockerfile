FROM node:lts AS build

# docker build -t willh/ngcli:latest --build-arg CLI_VERSION=8.0.0 -f Dockerfile .
ARG CLI_VERSION

# https://angular.io/cli/analytics
ENV NG_CLI_ANALYTICS off

RUN npm install -g @angular/cli@${CLI_VERSION} \
    && ng new demo1 --defaults --skip-git \
    && mv demo1 app \
    && rm -rf /root/.npm/

EXPOSE 4200
VOLUME [ "/app" ]

WORKDIR /app
ENTRYPOINT [ "ng", "serve", "--disable-host-check", "--host", "0.0.0.0", "--poll", "1000" ]
