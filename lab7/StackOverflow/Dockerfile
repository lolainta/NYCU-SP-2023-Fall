FROM ubuntu:22.04
MAINTAINER Lys

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq xinetd

RUN useradd -m lab
RUN chown -R root:root /home/lab
RUN chmod -R 755 /home/lab

USER lab
CMD ["/usr/sbin/xinetd", "-dontfork"]
