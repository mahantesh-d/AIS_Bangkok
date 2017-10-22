#install oracle java
#version 1.8

scp -P 64422 -oStrictHostKeyChecking=no 172.31.247.10:~/jdk-8u121-linux-x64.tar.gz .


#wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/jdk-8u121-linux-x64.tar.gz"

cd /app/

mkdir java

cd java/

mv ~/jdk-8u121-linux-x64.tar.gz .

tar -zxvf jdk-8u121-linux-x64.tar.gz


alternatives --install /usr/bin/java java /app/java/jdk1.8.0_121/bin/java 2
alternatives --install /usr/bin/jar jar /app/java/jdk1.8.0_121/bin/jar 2
alternatives --install /usr/bin/javac javac /app/java/jdk1.8.0_121/bin/javac 2


echo "export JAVA_HOME=/app/java/jdk1.8.0_121" >> /etc/bashrc
echo "export JRE_HOME=/app/java/jdk1.8.0_121/jre" >> /etc/bashrc
echo "export PATH=\$PATH:/app/java/jdk1.8.0_121/bin:/app/java/jdk1.8.0_121/jre/bin" >> /etc/bashrc

source /etc/bashrc

java -version

javac -version