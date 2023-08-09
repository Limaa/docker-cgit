FROM alpine:latest

RUN apk update && apk add \
	git cgit lighttpd \
	build-base lua5.3-dev luarocks5.3 openssl-dev \
	py3-pygments py3-markdown py3-docutils groff \
	&& luarocks-5.3 install luaossl

COPY config/about.html /usr/share/webapps/cgit/about.html
COPY config/cgitrc /etc/cgitrc
COPY config/lighttpd.conf /etc/lighttpd/cgit.conf
RUN printf '\ninclude "cgit.conf"\n' >> /etc/lighttpd/lighttpd.conf

EXPOSE 80
CMD ["/usr/sbin/lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
