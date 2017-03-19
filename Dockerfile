FROM python:3.6

RUN groupadd -g 911 abc \
 && useradd -m -s /bin/bash -g 911 -u 911 abc

RUN echo "deb http://ftp.debian.org/debian jessie-backports main" >/etc/apt/sources.list.d/jessie-backports.list

ADD docker-apt-install.sh /usr/local/sbin/docker-apt-install

ADD pip.conf /etc/

ENV PATH /pyenv/bin:$PATH
RUN mkdir /pyenv \
 && chown abc:abc /pyenv \
 && pip install virtualenv==15.1.0 \
 && chroot --userspec=abc / python3.6 -m virtualenv -p python3.6 /pyenv
