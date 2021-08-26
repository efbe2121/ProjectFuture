#! /bin/bash

DOCNAME="HaProxy"
if docker inspect haproxy &> /dev/null; then
	if [ "$( docker container inspect -f '{{.State.Running}}' $DOCNAME )" == "true" ]; then
		docker stop HaProxy && docker rm HaProxy
	else
		docker rm HaProxy
	fi
	docker run -d -p 100:80 --name HaProxy -v /media/master/Data/\[Project\]\ Blibli/PlaybookUsed/Monitoring/Haproxy/haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg haproxy
else
	docker build -t haproxy .
	docker run -d -p 100:80 --name HaProxy -v /media/master/Data/\[Project\]\ Blibli/PlaybookUsed/Monitoring/Haproxy/haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg haproxy
fi
