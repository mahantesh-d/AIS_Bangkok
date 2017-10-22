# Install common stuff
# Get Java tar gz :

scp -P 64422 -oStrictHostKeyChecking=no 172.31.247.10:~/jdk-8u121-linux-x64.tar.gz .


cd /app
mkdir java

# extract it..

mv home/cassandra/jdk-8u121-linux-x64.tar.gz /app/java
cd /app/java
tar -zxvf jdk-8u121-linux-x64.tar.gz

cd jdk1.8.0_121


# Alternatives install
echo -e "\n\n Alternatives Setup..."
alternatives --install /usr/bin/java java /app/java/jdk1.8.0_121/bin/java 2
alternatives --install /usr/bin/jar jar /app/java/jdk1.8.0_121/bin/jar 2
alternatives --install /usr/bin/javac javac /app/java/jdk1.8.0_121/bin/javac 2
alternatives --set jar app/java/jdk1.8.0_121/bin/jar
alternatives --set javac app/java/jdk1.8.0_121/bin/javac


# Set environment variables, temporary and permanent
echo -e "\n\n Setting up environment variables, temporary and permanent..."
export JAVA_HOME=/app/java/jdk1.8.0_121
export JRE_HOME=/app/java/jdk1.8.0_121/jre
export PATH=$PATH:/app/java/jdk1.8.0_121/bin:/app/java/jdk1.8.0_121/jre/bin

echo "export JAVA_HOME=/app/java/jdk1.8.0_121" >> /etc/bashrc
echo "export JRE_HOME=/app/java/jdk1.8.0_121/jre" >> /etc/bashrc
echo "export PATH=\$PATH:/app/java/jdk1.8.0_121/bin:/app/java/jdk1.8.0_121/jre/bin" >> /etc/bashrc



source /etc/bashrc

echo -e "\n\n Java Version:"
java -version

echo -e "\n\n Javac Version:"
javac -version