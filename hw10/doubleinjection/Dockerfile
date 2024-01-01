FROM node:alpine

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY ./app .

RUN yarn install

RUN echo 'FLAG{flag-1}' > /flag1.txt
RUN echo 'FLAG{flag-2}' > "/flag2-$(tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c 16).txt"

RUN node ./init-db.js && chmod 444 /etc/db.sqlite3

RUN adduser -D -h /home/ctf ctf
RUN chown -R ctf:ctf /usr/src/app

USER ctf

CMD [ "node", "app.js" ]
