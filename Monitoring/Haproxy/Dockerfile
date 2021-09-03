FROM alpine:latest

RUN addgroup --gid 99 --system haproxy; \
	adduser \
		--disabled-password \
		--home /var/lib/haproxy \
		--ingroup haproxy \
		--no-create-home \
		--system \
		--uid 99 \
		haproxy \
    && mkdir -p /var/lib/haproxy \
    && touch /var/lib/haproxy/stats; \
    apk add --no-cache haproxy

ENTRYPOINT haproxy -f /usr/local/etc/haproxy/haproxy.cfg
EXPOSE 80