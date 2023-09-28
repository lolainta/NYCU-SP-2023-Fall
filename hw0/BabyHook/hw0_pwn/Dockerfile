FROM ubuntu:20.04
MAINTAINER YingMuo

RUN apt-get update && \
    DEBAIN_FRONTEND=noninteractive apt-get install -qy xinetd && apt-get install -qy python3

RUN useradd -m chal
RUN chown -R root:root /home/chal
RUN chmod -R 755 /home/chal

CMD ["/usr/sbin/xinetd", "-dontfork"]
