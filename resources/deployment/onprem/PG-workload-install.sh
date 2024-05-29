# Install PG
sudo dnf module install postgresql:16/server -y

# bring down git
sudo yum install git -y

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
sed -i "s/127.0.01\/32/0.0.0.0\/0/g"  pg_hba.conf

sed -i "s/32/0/g"  pg_hba.conf
sed -i "s/127/0/g"  pg_hba.conf
sed -i '115s/\.1/\.0/;121s/\.1/\.0/' pg_hba.conf
sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" postgresql.conf
sed -i "s/#port = 5432/port = 5432/g" postgresql.conf
logout
sudo systemctl restart postgresql.service

# Create User and database
sudo -u postgres -i
psql

CREATE USER demouser WITH PASSWORD 'demopass123' CREATEROLE CREATEDB;
CREATE DATABASE mydatabase;
GRANT ALL PRIVILEGES ON DATABASE "mydatabase" to demouser;

# Start Apache
sudo systemctl start httpd
sudo systemctl enable httpd