#! /bin/bash

DOCNAME="Prometheus"

if docker inspect prometheus &> /dev/null; then
	if [ "$( docker container inspect -f '{{.State.Running}}' $DOCNAME )" == "true" ]; then
		docker stop $DOCNAME && docker rm $DOCNAME
	else
		docker rm $DOCNAME
	fi
	docker run -d -p 9090:9090 --name Prometheus -v /media/master/Data/\[Project\]\ Blibli/PlaybookUsed/Monitoring/Prometheus/prometheus.yml:/etc/prometheus/prometheus.yml prometheus
else
	docker build -t prometheus .
	docker run -d -p 9090:9090 --name Prometheus -v /media/master/Data/\[Project\]\ Blibli/PlaybookUsed/Monitoring/Prometheus/prometheus.yml:/etc/prometheus/prometheus.yml prometheus
fi
