#!/bin/bash

# bring down necessary utilities
sudo yum install git php php-pgsql httpd -y

# setup apache
sudo systemctl start httpd
sudo systemctl enable httpd

# setup firewall rules
sudo firewall-cmd --permanent --add-port=80/tcp
sudo firewall-cmd --permanent --add-port=443/tcp
sudo firewall-cmd --reload

#  Adjust SELinux to allow to allow HTTPD to make network connections  
sudo setsebool -P httpd_can_network_connect_db 1

# bring down the repository of things
sudo git clone https://github.com/microsoft/TechExcel-Migrate-Linux-workloads.git

# Copy in the php file
sudo cp TechExcel-Migrate-Linux-workloads/resources/deployment/onprem/webapp/orders.php /var/www/html