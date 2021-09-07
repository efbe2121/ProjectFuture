.  
├── Fail2Ban  
│   ├── jail.local  
│   └── updateFail2ban.yml  
├── Firewall Rules  
│   ├── database.txt  
│   ├── server1.txt  
│   └── server2.txt  
├── hosts.ini  
├── Monitoring  
│   ├── configureMonitoring.yml  
│   ├── docker-compose.yml  
│   ├── Grafana  
│   │   └── grafana_db  
│   │       ├── csv  
│   │       ├── grafana.db  
│   │       ├── plugins  
│   │       └── png  
│   ├── Haproxy  
│   │   ├── Dockerfile  
│   │   ├── haproxy.cfg  
│   │   ├── haproxy.cfg.j2  
│   │   └── haproxy.yml  
│   ├── NodeExporter  
│   │   ├── node_exporter  
│   │   ├── node_exporter.service  
│   │   └── nodeexporter.yml  
│   └── Prometheus  
│       ├── Dockerfile  
│       └── prometheus.yml  
├── Playbooks  
│   ├── mariaDB.yml  
│   ├── playbook1.yml  
│   ├── playbook2.yml  
│   ├── runDocker.yml  
│   └── secrets.yml  
├── README.md  
├── run.sh  
└── WordPress  
    └── Dockerfile  

################################################  
run.sh is the automated script to run everything  
with simple arrow keys and enter to choose  
################################################  

Provisioning VM & Container  
- Kickstart centos 7 minimal  
Method : iso filesystem  

- Containers :  
	- Server 1 (VM) : webservers (apache+php)  
	- Server 2 (VM)	: webservers (apache+php)  
	- Localhost     : prometheus, haproxy, grafana  

High Availability  
- Haproxy (Inside container)  
Loadbalancing 6 webservers on 2 servers with 3 ports each  
Different machine for webserver, database, and monitoring  

Services integrate each other (min 3)  
- Haproxy -> loadbalancing wordpress  
- Apache + PHP -> As base for wordpress  
- MariaDB-server -> For database  
- Prometheus + Grafana -> Monitoring  
- Ansible -> Automation for every server  
- NFS -> Volume for containers on each server for wordpress  

Monitoring each Services  
- Monitoring Infra:  
  - Node Exporter : As a extractor for each client machine and database then sending data to prometheus  
  - Haproxy : Have own built-in stats in url/stats for listing each server status  

Security  
- Firewalld   
Firewalld is configured by using ansible from Local Machine  
- File2Ban  
Also configured by using ansible from Local Machine  

░░░░░░░░░░░░▄▄░░░░░░░░░░░░░░  
░░░░░░░░░░░█░░█░░░░░░░░░░░░░  
░░░░░░░░░░░█░░█░░░░░░░░░░░░░  
░░░░░░░░░░█░░░█░░░░░░░░░░░░░  
░░░░░░░░░█░░░░█░░░░░░░░░░░░░  
██████▄▄█░░░░░██████▄░░░░░░░  
▓▓▓▓▓▓█░░░░░░░░░░░░░░█░░░░░░  
▓▓▓▓▓▓█░░░░░░░░░░░░░░█░░░░░░  
▓▓▓▓▓▓█░░░░░░░░░░░░░░█░░░░░░  
▓▓▓▓▓▓█░░░░░░░░░░░░░░█░░░░░░  
▓▓▓▓▓▓█░░░░░░░░░░░░░░█░░░░░░  
▓▓▓▓▓▓█████░░░░░░░░░██░░░░░░  
█████▀░░░░▀▀████████░░░░░░░░  
░░░░░░░░░░░░░░░░░░░░░░░░░░░░  
░▀█▀░░░▀█▀░▀█▀░▀█▀░░▀█▀▀▀▀█░  
░░█░░░░░█░░░█░▄▀░░░░░█░░░░░░  
░░█░░░░░█░░░█▀▄░░░░░░█▄▄▄░░░  
░░█░░░░░█░░░█░░▀▄░░░░█░░░░░░  
░▄█▄▄█░▄█▄░▄█▄░░▄█▄░▄█▄▄▄▄█░  
░░░░░░░░░░░░░░░░░░░░░░░░░░░░  
