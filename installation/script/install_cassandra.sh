#!/bin/bash
#echo -e "\n\n Create /opt/cassandra \n\n";
cd /tmp

#mkdir cassandra

cd cassandra_3.0.9


## Get Cassandra, extract
#echo -e "\n\n Download cassandra tar gz \n\n";
#wget http://archive.apache.org/dist/cassandra/3.0.9/apache-cassandra-3.0.9-bin.tar.gz apache-cassandra-3.0.9-bin.tar.gz

#Extract and clean
#echo -e "\n\n Extract and Clean \n\n";
tar -zxvf apache-cassandra-3.0.9-bin.tar.gz

# Clean
#mv apache-cassandra-3.0.9-bin.tar.gz/* .
#rm -rf apache-cassandra-3.0.9 apache-cassandra-3.0.9-bin.tar.gz

echo -e "\n\n Script Done \n\n";

echo "Install Directory : /tmp/cassandra_3.0.9/apache-cassandra-3.0.9"
echo "Configuration Directory : /tmp/cassandra_3.0.9/apache-cassandra-3.0.9/conf"
echo "Install Directory : /tmp/cassandra_3.0.9/apache-cassandra-3.0.9/bin"
echo "Data Directory : /tmp/cassandra_3.0.9 (Change this in conf/cassandra.yaml)"
echo "Log Directory : /tmp/cassandra_3.0.9 (Change this in conf/cassandra.yaml)"

echo -e "\n\n Setting CASSANDRA_PATH \n\n"
export CASSANDRA_PATH=/tmp/cassandra_3.0.9/apache-cassandra-3.0.9

echo -e "done"
echo -e "\n Start cassandra in the background"
$CASSANDRA_PATH/bin/cassandra -p $CASSANDRA_PATH/cassandra.pid

echo -e "\n\n Check cassandra service"
service cassandra status


export CASSANDRA_PATH=/opt/cassandra; export PATH=$PATH:$CASSANDRA_PATH/bin


echo -e "\n\n pushing you into cqlsh -- see if it works"


# https://www.tutorialspoint.com/cassandra/cassandra_create_data.htm

echo -e "\n\n\n\n Use these queries to test if stuff works : \n\n";

echo "CREATE KEYSPACE tracker WITH replication = { 'class': 'SimpleStrategy','replication_factor': '3'};"
echo "use tracker;"

echo "CREATE TABLE emp(emp_id int PRIMARY KEY, emp_name text, emp_city text, emp_sal varint, emp_phone varint);"

echo "INSERT INTO emp (emp_id, emp_name, emp_city, emp_phone, emp_sal) VALUES(1,'ram', 'Hyderabad', 9848022338, 50000);"

echo "SELECT * FROM emp;"

echo "\n\nSleeping for 10 secs, copy the stuff above..."
sleep(10)
cqlsh

sleep(5)
cqlsh
