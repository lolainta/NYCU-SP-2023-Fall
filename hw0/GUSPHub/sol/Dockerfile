FROM python:3.11

RUN apt update
RUN apt -y full-upgrade

RUN pip install --upgrade pip
RUN pip install "fastapi[all]"

WORKDIR /app

ENTRYPOINT ["uvicorn", "main:app", "--host", "0.0.0.0", "--reload"]
