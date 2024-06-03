#!/bin/bash

# Install PG
sudo dnf module install postgresql:16/server -y

# bring down necessary utilities
sudo yum install git php php-pgsql httpd -y

# setup apache
sudo systemctl start httpd
sudo systemctl enable httpd

# setup firewall rules
sudo firewall-cmd --permanent --add-port=80/tcp
sudo firewall-cmd --permanent --add-port=443/tcp
sudo firewall-cmd --permanent --add-port=5432/tcp
sudo firewall-cmd --reload

# Initialize PG
sudo postgresql-setup --initdb

# Start PG Service
sudo systemctl start postgresql.service
sudo systemctl enable postgresql.service


# Configre PG
sudo -u postgres -i
cd data
sed -i "s/ident/trust/g" pg_hba.conf
sed -i "s/peer/trust/g" pg_hba.conf
sed -i "s/32/0/g"  pg_hba.conf
sed -i "s/127/0/g"  pg_hba.conf
sed -i '115s/\.1/\.0/;121s/\.1/\.0/' pg_hba.conf
sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" postgresql.conf
sed -i "s/#port = 5432/port = 5432/g" postgresql.conf
logout
sudo systemctl restart postgresql.service

#    
sudo setsebool -P httpd_can_network_connect_db 1

# bring down Northwind database
sudo git clone https://github.com/HeyMo0sh/northwind_psql.git
# sudo git clone git@github.com:pthom/northwind_psql.git

# Create User and database
sudo -u postgres psql -c 'create database northwind;'
sudo -u postgres psql -c "CREATE USER demouser WITH PASSWORD 'demopass123';"

# Populate database
# bring down file to home and then sudo cp to /var/lib/pgsql
sudo cp northwind_psql/northwind.sql /var/lib/pgsql
sudo -u postgres psql -d northwind -a -f /var/lib/pgsql/northwind.sql
sudo -u postgres psql -d northwind -c "GRANT SELECT ON ALL TABLES IN SCHEMA public TO demouser;"
sudo -u postgres psql -d northwind -c "GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO demouser;"

# Copy in the php file
sudo cp northwind_psql/orders.php /var/www/html