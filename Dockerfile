FROM python:2.7

RUN groupadd -g 911 abc \
 && useradd -m -s /bin/bash -g 911 -u 911 abc

RUN echo "deb http://ftp.debian.org/debian jessie-backports main" >/etc/apt/sources.list.d/jessie-backports.list

ADD docker-apt-install.sh /usr/local/sbin/docker-apt-install

ADD pip.conf /etc/

ENV PATH /pyenv/bin:$PATH
RUN mkdir /pyenv \
 && chown abc:abc /pyenv \
 && chroot --userspec=abc / python2.7 -m virtualenv -p python2.7 /pyenv
