FROM node:20-alpine

ENV PUPPETEER_EXECUTABLE_PATH="/usr/bin/chromium-browser"\
    PUPPETEER_SKIP_DOWNLOAD="true"
RUN apk add chromium

WORKDIR /app

COPY ./ /app

RUN yarn install

CMD ["yarn", "start"]

