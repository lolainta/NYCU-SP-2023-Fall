# Ref: https://people.cs.nycu.edu.tw/~chuang/courses/unixprog/resources/ubuntu/Dockerfile
FROM ubuntu:22.04

# install packages
RUN apt-get update
RUN yes | unminimize
RUN apt-get install -y tini iproute2 iputils-ping net-tools netcat
RUN apt-get install -y openssh-server sudo vim grep gawk rsync tmux diffutils file
RUN apt-get install -y gcc gdb make yasm nasm tcpdump python3 python3-pip python3-virtualenv
RUN apt-get install -y gcc-multilib g++-multilib
RUN apt-get install -y libc6-dbg dpkg-dev
RUN apt-get install -y curl git fish
RUN apt-get install -y ruby-dev wget
RUN pip3 install pwntools capstone filebytes keystone-engine ropper
RUN gem install seccomp-tools
RUN gem install one_gadget
#RUN apt-get install -y musl
#RUN ln -s /lib/x86_64-linux-musl/libc.so /usr/lib/libc.musl-x86_64.so.1
# /var/run/sshd: required on ubuntu
RUN mkdir /var/run/sshd

# locale
RUN apt-get install -y locales
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
RUN /usr/sbin/locale-gen

# gen ssh-keys, allow empty password
# RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
# RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
# RUN echo 'PermitEmptyPasswords yes' >> /etc/ssh/sshd_config
# RUN sed -i 's/nullok_secure/nullok/' /etc/pam.d/common-auth

# add user/group, empty password, allow sudo
RUN groupadd -g 1000 llt
RUN useradd --uid 1000 --gid 1000 --groups root,sudo,adm,users --create-home --password '' --shell /usr/bin/fish llt
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER llt
WORKDIR /home/llt
RUN bash -c "$(curl -fsSL http://gef.blah.cat/sh)"
# RUN git clone https://github.com/pwndbg/pwndbg.git
# RUN cd pwndbg && ./setup.sh

# run the service
ENTRYPOINT ["sleep", "infinity"]

