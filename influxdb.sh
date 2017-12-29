#Influxdb installation

#creating the repo for influxdb
cat <<EOF>> /etc/yum.repos.d/influxdb.repo
[influxdb]
name = InfluxDB Repository - RHEL \$releasever
baseurl = https://repos.influxdata.com/rhel/\$releasever/\$basearch/stable
enabled = 1
gpgcheck = 1
gpgkey = https://repos.influxdata.com/influxdb.key
EOF

#Installation influxdb from yum
yum -y install influxdb

#start influxdb service
service influxdb start

#verifying the influxd
ps aux | grep influx | grep -v "grep" | awk '{print $2}'

#starting the influxdb services
service influxd start &

#Checking the status
service influxd status | grep -w "active"

#influx cli
influx