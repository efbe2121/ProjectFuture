#! /bin/bash

TITLE="Automation v2"
ISI="Ini adalah menu box untuk automasi terhadap beberapa hal sesuai dengan pilihan yang tersedia"

OPTION=$(whiptail --title "$TITLE" --menu "$ISI" 25 78 10 \
"1" "Add New Client (user@IP) to automate" \
"2" "Initialization" \
"3" "Docker" \
"4" "Haproxy" \
"5" "Prometheus" \
"6" "Grafana" \
"7" "Node Exporter" \
"8" "Update database" \
"9" "Fail2Ban" \
"10" "Change hosts inventory" 3>&1 1>&2 2>&3)

if [ "$OPTION" == 1 ]; then

	IPPP=$(whiptail --title "$TITLE" --inputbox "Input the client@ip" 25 78 3>&1 1>&2 2>&3)
	sed "/\[webservers\]/a $IPPP" hosts.ini > .something.tmp \
	&& sed "/\[allserver\]/a $IPPP" .something.tmp > host.ini \
	&& mv host.ini hosts.ini

elif [ "$OPTION" == 2 ]; then

	ansible-playbook -i hosts.ini -e @Playbooks/secrets.yml --vault-password-file /etc/ansible/.pwd Playbooks/Inisialisasi/playbook.yml

elif [ "$OPTION" == 3 ]; then

	ansible-playbook -i hosts.ini -e @Playbooks/secrets.yml --vault-password-file /etc/ansible/.pwd Playbooks/Docker/playbook.yml

elif [ "$OPTION" == 4 ]; then

	ansible-playbook -i hosts.ini -e @Playbooks/secrets.yml --vault-password-file /etc/ansible/.pwd Playbooks/Haproxy/playbook.yaml

elif [ "$OPTION" == 5 ]; then

	ansible-playbook -i hosts.ini -e @Playbooks/secrets.yml --vault-password-file /etc/ansible/.pwd Playbooks/Prometheus/playbook.yml

elif [ "$OPTION" == 6 ]; then

	ansible-playbook -i hosts.ini -e @Playbooks/secrets.yml --vault-password-file /etc/ansible/.pwd Playbooks/Grafana/playbook.yaml

elif [ "$OPTION" == 7 ]; then

	ansible-playbook -i hosts.ini -e @Playbooks/secrets.yml --vault-password-file /etc/ansible/.pwd Playbooks/NodeExporter/playbook.yaml

elif [ "$OPTION" == 8 ]; then

	ansible-playbook -i hosts.ini -e @Playbooks/secrets.yml --vault-password-file /etc/ansible/.pwd Playbooks/MariaDB/mariaDB.yml

elif [ "$OPTION" == 9 ]; then

    ansible-playbook -i hosts.ini -e @Playbooks/secrets.yml --vault-password-file /etc/ansible/.pwd Fail2Ban/updateFail2ban.yml

elif [ "$OPTION" == 10 ]; then

    nano ./hosts.ini

fi