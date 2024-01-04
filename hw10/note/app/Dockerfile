FROM python:alpine
RUN pip3 install flask redis rq

COPY . /app

WORKDIR /app

RUN adduser -D -u 1000 ctf
RUN chown -R ctf:ctf /app
RUN chmod -R 555 /app && chmod -R 744 /app/notes

RUN mkdir -p /app/notes/admin && rm -rf /app/notes/admin/*
RUN UUID=$(python -c 'import uuid; print(uuid.uuid4(), end="")') && \
    echo -e "admin\nFLAG1\nFLAG{flag-1}" > "/app/notes/admin/$UUID" 

RUN chmod -R 555 /app/notes/admin

RUN echo 'FLAG{flag-2}' > "/flag2-$(tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c 16).txt" && \
    chmod 444 /flag2-*

USER ctf


CMD [ "sh", "-c", "flask run --host=0.0.0.0 --port=5000" ]

