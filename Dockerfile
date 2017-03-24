FROM python:3.6

# linuxserver.io's images default to having abc user with gid/uid 911
RUN groupadd -g 911 abc \
 && useradd -m -s /bin/bash -g 911 -u 911 abc

RUN echo "deb http://ftp.debian.org/debian jessie-backports main" >/etc/apt/sources.list.d/jessie-backports.list

ADD docker-apt-install.sh /usr/local/sbin/docker-apt-install
RUN docker-apt-install apt-utils

ADD pip.conf /etc/

ENV PATH /pyenv/bin:$PATH
RUN mkdir /pyenv \
 && chown abc:abc /pyenv \
 && chroot --userspec=abc / python3.6 -m venv /pyenv
