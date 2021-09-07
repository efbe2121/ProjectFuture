#! /bin/bash

TITLE="Automation v2"
ISI="Ini adalah menu box untuk automasi terhadap beberapa hal sesuai dengan pilihan yang tersedia"

OPTION=$(whiptail --title "$TITLE" --menu "$ISI" 25 78 11 \
"1" "Add New Client (user@IP) to automate" \
"2" "Run the initialization" \
"3" "Run the docker" \
"4" "Update Fail2Ban Configs" \
"5" "Change the hosts inventory" \
"6" "Update HaProxy Configs & Initiate Node_exporter" \
"7" "Run the load balancer & monitoring apps" \
"8" "Restart prometheus" \
"9" "Restart grafana" \
"10" "Restart haproxy" \
"11" "Update database" 3>&1 1>&2 2>&3)

if [ "$OPTION" == 1 ]; then

	IPPP=$(whiptail --title "$TITLE" --inputbox "Input the client@ip" 25 78 3>&1 1>&2 2>&3)
	sed "/\[webservers\]/a $IPPP" hosts.ini > .something.tmp \
	&& sed "/\[allserver\]/a $IPPP" .something.tmp > host.ini \
	&& mv host.ini hosts.ini

elif [ "$OPTION" == 2 ]; then

	ansible-playbook -i hosts.ini -e @Playbooks/secrets.yml --vault-password-file /etc/ansible/.pwd Playbooks/playbook1.yml Playbooks/playbook2.yml

elif [ "$OPTION" == 3 ]; then

	ansible-playbook -i hosts.ini -e @Playbooks/secrets.yml --vault-password-file /etc/ansible/.pwd Playbooks/runDocker.yml

elif [ "$OPTION" == 4 ]; then

	ansible-playbook -i hosts.ini -e @Playbooks/secrets.yml --vault-password-file /etc/ansible/.pwd Fail2Ban/updateFail2ban.yml

elif [ "$OPTION" == 5 ]; then

	nano hosts.ini

elif [ "$OPTION" == 6 ]; then

	ansible-playbook -i hosts.ini -e @Playbooks/secrets.yml --vault-password-file /etc/ansible/.pwd Monitoring/configureMonitoring.yml

elif [ "$OPTION" == 7 ]; then

	cd ./Monitoring && docker-compose up -d

elif [ "$OPTION" == 8 ]; then

	cd ./Monitoring && docker-compose restart prometheus

elif [ "$OPTION" == 9 ]; then

    cd ./Monitoring && docker-compose restart grafana

elif [ "$OPTION" == 10 ]; then

    cd ./Monitoring && docker-compose restart haproxy

elif [ "$OPTION" == 11 ]; then

	ansible-playbook -i hosts.ini -e @Playbooks/secrets.yml --vault-password-file /etc/ansible/.pwd Playbooks/mariaDB.yml

fi