FROM alpine:latest

RUN apk add --no-cache prometheus

ENTRYPOINT ["prometheus"]
CMD ["--config.file=/etc/prometheus/prometheus.yml"]

EXPOSE 9090