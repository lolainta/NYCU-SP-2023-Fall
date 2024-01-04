FROM python:3.11


RUN apt update && \
    apt install -y --no-install-recommends chromium-driver redis-server


RUN apt update && \
    apt install -y --no-install-recommends chromium

RUN rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir selenium redis rq

COPY bot.py /bot.py
COPY run.sh /run.sh
RUN chmod +x /run.sh

RUN useradd --no-create-home --home-dir / --shell /bin/false user
CMD bash /run.sh
