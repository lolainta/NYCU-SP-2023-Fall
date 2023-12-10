FROM ubuntu@sha256:67211c14fa74f070d27cc59d69a7fa9aeff8e28ea118ef3babc295a0428a6d21
MAINTAINER YingMuo

RUN apt-get update && \
    DEBAIN_FRONTEND=noninteractive apt-get install -qy xinetd

RUN useradd -m chal
RUN chown -R root:root /home/chal
RUN chmod -R 755 /home/chal

CMD ["/usr/sbin/xinetd", "-dontfork"]
