#! /bin/bash

TITLE="Automation v2"
ISI="Ini adalah menu box untuk automasi terhadap beberapa hal sesuai dengan pilihan yang tersedia"

OPTION=$(whiptail --title "$TITLE" --menu "$ISI" 25 78 5 \
"1" "Add New Client (user@IP) to automate" \
"2" "Run the initialization" \
"3" "Run the docker" \
"4" "Update Fail2Ban Configs" \
"5" "Change the hosts inventory" 3>&1 1>&2 2>&3)

if [ "$OPTION" == 1 ]; then

	IPPP=$(whiptail --title "$TITLE" --inputbox "Input the client@ip" 25 78 3>&1 1>&2 2>&3)
	sed "/\[webservers\]/a $IPPP" hosts.ini > .something.tmp \
	&& sed "/\[allserver\]/a $IPPP" .something.tmp > host.ini \
	&& mv host.ini hosts.ini

elif [ "$OPTION" == 2 ]; then

	ansible-playbook -i hosts.ini ./Playbooks/playbook1.yml ./Playbooks/playbook2.yml --ask-pass

elif [ "$OPTION" == 3 ]; then

	ansible-playbook -i hosts.ini ./Playbooks/runDocker.yml --ask-pass

elif [ "$OPTION" == 4 ]; then

	ansible-playbook -i hosts.ini ./Fail2Ban/updateFail2ban.yml --ask-pass

elif [ "$OPTION" == 5 ]; then

	nano hosts.ini

fi
