FROM bwstitt/debian:jessie

ENV PATH /pyenv/bin:$PATH
RUN docker-apt-install python3 \
 && mkdir /pyenv \
 && chown abc:abc /pyenv \
 && chroot --userspec=abc / pyvenv-3.4 /pyenv \
 && chroot --userspec=abc / pip install -U pip==9.0.1 setuptools==34.3.1

# TODO: put no-cache-dir into pip.conf
