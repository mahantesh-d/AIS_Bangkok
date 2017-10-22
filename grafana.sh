#docker creating the container instruction
#docker run --privileged -d -ti -e "container=docker" -v /sys/fs/cgroup:/sys/fs/cgroup <image_id> /usr/sbin/init


#Grafana Installation 

#installing grafana from yum 
yum -y install https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-4.5.2-1.x86_64.rpm

#start the grafana service
service grafana-server start

#checking the installation
ps aux | grep grafana | grep -v "grep" | awk '{print $2}'