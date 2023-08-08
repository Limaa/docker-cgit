FROM debian:bookworm-slim

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade --yes
RUN apt-get install --yes git build-essential \
	libz-dev libssl-dev lua5.4 liblua5.4-dev liblua5.4-0-dbg lua-luaossl
	# libz-dev libssl-dev luajit libluajit-5.1-common libluajit-5.1-dev lua-luaossl

RUN git clone --recurse-submodule --depth 1 https://git.zx2c4.com/cgit \
	&& cd /cgit \
	&& make install -j



RUN apt-get install --yes \
	nginx fcgiwrap supervisor \
	python3-pygments python3-markdown python3-docutils groff

COPY config/cgitrc /etc/cgitrc
COPY config/supervisord.conf /etc/supervisord.conf
COPY config/nginx.conf /etc/nginx/sites-available/cgit

RUN ln -s /etc/nginx/sites-available/cgit /etc/nginx/sites-enabled/cgit \
	&& rm /etc/nginx/sites-enabled/default

EXPOSE 80
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
