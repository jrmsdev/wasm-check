FROM debian:trixie-20240812-slim

LABEL maintainer="Jeremías Casteglione <jrmsdev@gmail.com>"
LABEL version="240821"

USER root:root

ENV DEBIAN_FRONTEND noninteractive

ENV APT_INSTALL bash openssl ca-certificates rustup

RUN apt-get clean && \
	apt-get update -yy && \
	apt-get dist-upgrade -yy --purge && \
	apt-get install -yy --no-install-recommends ${APT_INSTALL} && \
	apt-get clean && \
	apt-get autoremove -yy --purge && \
	rm -rf /var/lib/apt/lists/* \
		/var/cache/apt/archives/*.deb \
		/var/cache/apt/*cache.bin

RUN rustup --version && \
	rustup default stable

RUN rustc --version && \
	cargo --version

CMD /bin/bash -i -l
