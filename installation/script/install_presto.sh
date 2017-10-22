#!/bin/bash

function help() {

        echo "Usage : "$0" <install-directory> <coordinator-flag> <comma-separated-contact-points> <coordinator-host> <coordinator-port>"
                echo -e "\t\tinstall-directory : directory where presto will be installed and setup"
                echo -e "\t\tcoordinator-flag : this can take two values <true | false>"
                echo -e "\t\tcomma-separated-contact-points : List of cassandra contact-points for Cassandra Catalog"
                echo -e "\t\tcoordinator-host : Host of the Presto Co-ordinator"
                echo -e "\t\tcoordinator-port : Port of the Presto Co-ordinator"
                echo -e "================================================================================================================"
                echo -e "\t\tFor example :"
                echo -e "\t\tCo-ordinator node -"
                echo -e "\t\t$0 /home/bigdata/presto true 127.0.0.1,127.0.0.2 127.0.0.1 8080"
                echo -e "\tWorked node -"
                echo -e "\t\t$0 /home/bigdata/presto false 127.0.0.1,127.0.0.2 127.0.0.1 8080"
        exit 1;
}


if [ $# -lt 5 ]
then
        help
fi

if [ $2 != "true" -a $2 != "false" ]
then
                help
fi

# get required variables ready
target_directory=$1
coordinator_flag=$2
comma_separated_contact_points=$3
coordinator_host=$4
coordinator_port=$5

# ------ Display params -----
echo "####PARAMETERS####"
echo "coordinator_flag : "$coordinator_flag
echo "comma_separated_contact_points : "$comma_separated_contact_points
echo "coordinator_host : "$coordinator_host
echo "coordinator_port : "$coordinator_port
echo "####PARAMETERS###"


read -r -p "Continue with the above configuration? [y/N] " response
case $response in
    [yY][eE][sS]|[yY])

        ;;
    *)
        exit 0;
        ;;
esac



# identify the network interface
if=$(ip r | head -1 | awk '{print $5}')

# get the ip
#ip=$(ip r | grep $if | tail -1 | awk '{print $(NF-2)}')
ip=$(hostname -i)
# download and extract presto server
cd $target_directory
wget https://repo1.maven.org/maven2/com/facebook/presto/presto-server/0.162/presto-server-0.162.tar.gz
tar -zxvf presto-server-0.162.tar.gz

# add / edit the required configuration
cd presto-server-0.162
mkdir etc

# --- Node Properties ---
node_id=$(echo $ip | sed 's/\.//gi')
> etc/node.properties
cat << EOF >> etc/node.properties
node.environment=development
node.id=ffffffff-ffff-ffff-ffff-ffffffffffff$node_id
node.data-dir=/var/presto/data
EOF

# --- JVM Config ---
> etc/jvm.config
cat << EOF >> etc/jvm.config
-server
-Xmx16G
-XX:+UseG1GC
-XX:G1HeapRegionSize=32M
-XX:+UseGCOverheadLimit
-XX:+ExplicitGCInvokesConcurrent
-XX:+HeapDumpOnOutOfMemoryError
-XX:OnOutOfMemoryError=kill -9 %p
EOF

# --- Config Properties ---
> etc/config.properties
if [ $coordinator_flag == "true" ]
then
cat << EOF >> etc/config.properties
coordinator=true
node-scheduler.include-coordinator=false
http-server.http.port=$coordinator_port
query.max-memory=50GB
query.max-memory-per-node=1GB
discovery-server.enabled=true
discovery.uri=http://$coordinator_host:$coordinator_port
EOF
else
cat << EOF >> etc/config.properties
coordinator=false
http-server.http.port=$coordinator_port
query.max-memory=50GB
query.max-memory-per-node=1GB
discovery.uri=http://$coordinator_host:$coordinator_port
EOF
fi

# --- Log Properties ---
> etc/log.properties
cat << EOF >> etc/log.properties
com.facebook.presto=INFO
EOF

# --- Cassandra Catalog properties ---
cd etc
mkdir catalog
> catalog/cassandra.properties
cat << EOF >> catalog/cassandra.properties
connector.name=cassandra
cassandra.contact-points=$comma_separated_contact_points
EOF
echo -e "Installation [\e[32m OK \e[0m]"

cd $target_directory
wget https://repo1.maven.org/maven2/com/facebook/presto/presto-cli/0.162/presto-cli-0.162-executable.jar

chmod +x presto-cli-0.162-executable.jar
cp presto-cli-0.162-executable.jar presto
