#! /bin/bash

DOCNAME="Grafana"
GRAF_VERS="8.1.2"

if docker inspect "grafana/grafana:$GRAF_VERS" &> /dev/null; then
	GRAF_LOCAL_VERS=$(docker inspect --format='{{.RepoTags}}' grafana/grafana:8.1.2 | awk -F'grafana:' '{print $2}' | awk -F']' '{print $1}')
	echo -e "$GRAF_LOCAL_VERS"
	if [ "$GRAF_VERS" == "$GRAF_LOCAL_VERS" ]; then
		echo -e "MASUK KE 1"
		if [ "$( docker container inspect -f '{{.State.Running}}' $DOCNAME )" == "true" ]; then
			docker stop $DOCNAME && docker rm $DOCNAME
		else
			echo -e "MASUK KE 2"
			docker rm $DOCNAME
		fi
		docker run -d -p 3000:3000 --name Grafana -v /media/master/Data/\[Project\]\ Blibli/grafana_db:/var/lib/grafana grafana/grafana:$GRAF_VERS
	else
		echo -e "MASUK KE 3"
		docker rmi grafana/grafana:$GRAF_LOCAL_VERS
		docker pull grafana/grafana:$GRAF_VERS
        	docker run -d -p 3000:3000 --name Grafana -v /media/master/Data/\[Project\]\ Blibli/grafana_db:/var/lib/grafana grafana/grafana:$GRAF_VERS
	fi
else
	echo -e "MASUK KE 4"
	docker pull grafana/grafana:$GRAF_VERS
	docker run -d -p 3000:3000 --name Grafana -v /media/master/Data/\[Project\]\ Blibli/grafana_db:/var/lib/grafana grafana/grafana:$GRAF_VERS
fi
