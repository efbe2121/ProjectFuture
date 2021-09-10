# Structure & Explanations
```bash
.
├── Apache2Configs
│   ├── conf.d
│   │   ├── default.conf
│   │   ├── info.conf
│   │   ├── languages.conf
│   │   ├── mpm.conf
│   │   ├── php7-module.conf
│   │   └── userdir.conf
│   ├── httpd.conf
│   ├── magic
│   ├── mime.types
│   └── Readme.txt
├── Fail2Ban
│   ├── jail.local
│   └── updateFail2ban.yml
├── Firewall Rules
│   ├── database.txt
│   ├── server1.txt
│   ├── server2.txt
│   └── server monitoring.txt
├── hosts.ini
├── Playbooks
│   ├── Docker
│   │   ├── Docker
│   │   │   ├── defaults
│   │   │   │   └── main.yaml
│   │   │   ├── files
│   │   │   ├── handlers
│   │   │   │   └── main.yml
│   │   │   ├── meta
│   │   │   ├── tasks
│   │   │   │   ├── install.yml
│   │   │   │   ├── main.yml
│   │   │   │   ├── mounting.yml
│   │   │   │   ├── permission.yml
│   │   │   │   └── running.yml
│   │   │   ├── templates
│   │   │   └── vars
│   │   └── playbook.yml
│   ├── Grafana
│   │   ├── Grafana
│   │   │   ├── defaults
│   │   │   │   └── main.yml
│   │   │   ├── files
│   │   │   ├── handlers
│   │   │   │   └── main.yml
│   │   │   ├── meta
│   │   │   ├── tasks
│   │   │   │   ├── config.yml
│   │   │   │   ├── install.yml
│   │   │   │   ├── main.yml
│   │   │   │   └── verify.yml
│   │   │   ├── templates
│   │   │   │   └── grafana.ini.j2
│   │   │   └── vars
│   │   └── playbook.yaml
│   ├── Haproxy
│   │   ├── Haproxy
│   │   │   ├── defaults
│   │   │   │   └── main.yml
│   │   │   ├── files
│   │   │   ├── handlers
│   │   │   │   └── main.yaml
│   │   │   ├── meta
│   │   │   ├── tasks
│   │   │   │   ├── check.yml
│   │   │   │   ├── config.yml
│   │   │   │   ├── install.yml
│   │   │   │   └── main.yml
│   │   │   ├── templates
│   │   │   │   └── haproxy.cfg.j2
│   │   │   └── vars
│   │   └── playbook.yaml
│   ├── Inisialisasi
│   │   ├── Inisialisasi
│   │   │   ├── defaults
│   │   │   │   └── main.yml
│   │   │   ├── files
│   │   │   ├── handlers
│   │   │   │   └── main.yml
│   │   │   ├── meta
│   │   │   ├── tasks
│   │   │   │   ├── firewall.yml
│   │   │   │   ├── main.yml
│   │   │   │   └── yum.yml
│   │   │   ├── templates
│   │   │   └── vars
│   │   └── playbook.yml
│   ├── MariaDB
│   │   └── mariaDB.yml
│   ├── NodeExporter
│   │   ├── NodeExp
│   │   │   ├── defaults
│   │   │   │   └── main.yml
│   │   │   ├── files
│   │   │   ├── handlers
│   │   │   │   └── main.yml
│   │   │   ├── meta
│   │   │   ├── tasks
│   │   │   │   ├── check.yml
│   │   │   │   ├── install.yml
│   │   │   │   ├── main.yml
│   │   │   │   ├── service.yml
│   │   │   │   └── verify.yml
│   │   │   ├── templates
│   │   │   │   └── node_exporter.service.j2
│   │   │   └── vars
│   │   └── playbook.yaml
│   ├── Prometheus
│   │   ├── playbook.yml
│   │   └── Prometheus
│   │       ├── defaults
│   │       │   └── main.yaml
│   │       ├── files
│   │       ├── handlers
│   │       │   └── main.yml
│   │       ├── meta
│   │       ├── tasks
│   │       │   ├── check.yml
│   │       │   ├── config.yml
│   │       │   ├── install.yml
│   │       │   ├── main.yml
│   │       │   └── verify.yml
│   │       ├── templates
│   │       │   ├── prometheus.service.j2
│   │       │   └── prometheus.yml.j2
│   │       └── vars
│   └── secrets.yml
├── README.md
├── run.sh
└── WordPress
    ├── Dockerfile
    └── wp-config.php

61 directories, 72 files
```
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
- Monitoring Infra  
  -  Node Exporter : As a extractor for each client machine and database then sending data to prometheus  
  -  Haproxy : Have own built-in stats in url/stats for listing each server status  

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
