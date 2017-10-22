_________________________________________

-Enabling the JMX server in cassandra
_________________________________________


-edit the cassandra-env.sh
		if [ "x$LOCAL_JMX" = "x" ]; then
			LOCAL_JMX=yes          #from yes --> no
		fi
		etc/cassandra/jmxremote.password			#change the file path or create the directory and file in the default path




-Create the file in 
		/opt/cassandra/jmxremote.password
		chown cassandra:cassandra /opt/cassandra/jmxremote.password 			#Correct owner
		chmod 400 /opt/cassandra/jmxremote.password 							#Dont forget to give the only read premission

-Restart the cassandra
		nodetool stopdaemon
		cassandra
________________________________________________________________________________________________________________________________




 

