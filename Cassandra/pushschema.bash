#change the directory to /opt/
cd /opt/

#clone the repo into /opt/
ssh-agent bash -c 'ssh-add /opt/mahantesh; git clone git@github.com:dminGod/d30_40_schema.git'

#change directory to repo
cd /opt/d30_40_schema

#making the required changes to run the schema 
#---------------------------------------------------
#changing the database name
sed -i 's/all_trade/alltrade_iot/g' alltrade_iot.cql
sed -i 's/all_trade/alltrade_prod/g' production_schema.cql
sed -i 's/all_trade/alltrade_test/g' all_trade_test_schema.cql

#changing the replication_factor to proper number
sed -i 's/datacenter1/replication_factor/g' all_trade_test_schema.cql
sed -i "s/'dc1': '5', 'dc2': '2', 'dc3': '3'/'replication_factor':'2'/g" alltrade_iot.cql

#changing the strategy 'NetworkTopologyStrategy' to 'SimpleStrategy'
sed -i 's/NetworkTopologyStrategy/SimpleStrategy/g' alltrade_iot.cql
sed -i 's/NetworkTopologyStrategy/SimpleStrategy/g' all_trade_test_schema.cql
sed -i 's/NetworkTopologyStrategy/SimpleStrategy/g' production_schema.cql

#run the schema script from command line
/opt/cassandra/apache-cassandra-3.9/bin/cqlsh 10.5.0.8 -f alltrade_iot.cql --request-timeout=9000
/opt/cassandra/apache-cassandra-3.9/bin/cqlsh 10.5.0.8 -f all_trade_test_schema.cql --request-timeout=9000
/opt/cassandra/apache-cassandra-3.9/bin/cqlsh 10.5.0.8 -f production_schema.cql --request-timeout=9000