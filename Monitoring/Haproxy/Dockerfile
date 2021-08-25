FROM alpine:latest

RUN apk add haproxy

ENTRYPOINT haproxy -f /usr/local/etc/haproxy/haproxy.cfg
EXPOSE 80
