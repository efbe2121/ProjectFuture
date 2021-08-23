Provisioning VM & Container
- Kickstart centos 7 minimal
- Docker :
	- Server 1 (VM) : webservers (apache+http+php)
	- Server 2 (VM)	: webservers (apache+http+php)
	- Localhost     : prometheus, haproxy, grafana

High Availability
- Haproxy (Inside container) loadbalancing 6 webservers on 2 servers with 3 ports each

Services integrate each other (minimal 3)
- Haproxy -> loadbalancing wordpress 
- Apache + Http -> As base for wordpress
- MariaDB-server -> For database
- Prometheus + Grafana -> Monitoring
- Ansible -> Automation for every server
- NFS -> Volume for containers on each server for wordpress

Monitoring each Services
- Monitoring Infra (Node Exporter, Haproxy, MySql) : Menggunakan prometheus dan grafana

Security
- Firewalld
- File2Ban (otw)
