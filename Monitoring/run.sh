#!/bin/bash

if ! docker rm frontEND; then
	echo -e "Berhasil di remove"
	docker run -d -p 100:80 -v /media/master/Data/\[Project\]\ Blibli/PlaybookUsed/Monitoring/haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg --name frontEND haproxy
else
	echo -e "Not running, skipping"
	docker run -d -p 100:80 -v /media/master/Data/\[Project\]\ Blibli/PlaybookUsed/Monitoring/haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg --name frontEND haproxy
fi

echo -e "Re-enable node_exporter on each server"

ansible-playbook -i ../hosts.ini nodeexporter.yml --ask-pass

echo -e "Now running Prometheus"

docker run -d -p 9090:9090 -v /media/master/Data/\[Project\]\ Blibli/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus

echo -e "Now running Grafana"

docker run -d -p 3001:3000 -v /media/master/Data/\[Project\]\ Blibli/grafana_db:/var/lib/grafana grafana/grafana

