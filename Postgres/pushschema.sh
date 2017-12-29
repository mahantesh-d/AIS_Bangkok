# Change the the directory to clone the hector repo
cd /opt

# Clone the hector repo place the ssh key mahantesh, of git repo in /opt
sudo ssh-agent bash -c 'ssh-add /opt/mahantesh; git clone git@github.com:dminGod/d30_40_schema.git'

#Change the directory to basD30-HectorDA
cd /opt/d30_40_schema

#Creating the users
psql -p 30001 postgres -c "CREATE USER admin_alltrade LOGIN CREATEDB"
psql -p 30001 postgres -c "CREATE USER ro_alltrade LOGIN CREATEDB"
psql -p 30001 postgres -c "CREATE USER serveradm LOGIN CREATEDB"
psql -p 30001 postgres -c "CREATE USER toro LOGIN CREATEDB"

#Creating the database
psql -p 30001 -c "CREATE DATABASE "alltrade_prod"  ENCODING 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';"
psql -p 30001 -c "CREATE DATABASE "alltrade_iot" ENCODING 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';"
psql -p 30001 -c "CREATE DATABASE "alltrade_test" ENCODING 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';"

#Pushing the schema into the alltrade_test database
psql -p 30001 alltrade_test -f alltrade_test.sql

#Pushing the schema into the alltrade_prod database
psql -p 30001 alltrade_prod -f alltrade_prod.sql

#Pushing the schema into the alltrade_iot database
psql -p 30001 alltrade_iot -f alltrade_iot.sql