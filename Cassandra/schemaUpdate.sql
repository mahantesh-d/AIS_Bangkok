--Making the Same Schema Version for all nodes
nodetool describecluster
--[serveradm@DS4SCASA002G ~]$ nodetool describecluster
--Cluster Information:
--        Name: Test Cluster
--        Snitch: org.apache.cassandra.locator.DynamicEndpointSnitch
--        Partitioner: org.apache.cassandra.dht.Murmur3Partitioner
--        Schema versions:
--                e53a2a45-62b1-344b-8000-03fd38bea00b: [10.138.32.232, 10.138.32.78, 10.138.32.79, 10.138.32.81, 10.138.32.230, 10.138.32.231]

--                d759c3dd-9e6c-31cf-89b9-a99a7921c54a: [10.138.32.76, 10.138.32.77, 10.138.32.80]

--check the schema versions of your nodes in system.local and system.peers.
SELECT schema_version,key FROM system.local;
SELECT schema_version,peer FROM system.peers;

--Update the Schema Version using cqlsh		
UPDATE system.local SET schema_version = d759c3dd-9e6c-31cf-89b9-a99a7921c54a where key = 'local';

--RESTART the Cassandra
nodetool stopdaemon
cassandra

--Then Check schema_version
nodetool describecluster
--[serveradm@DS4SCASA002G ~]$ nodetool describecluster                    
--Cluster Information:
--        Name: Test Cluster
--        Snitch: org.apache.cassandra.locator.DynamicEndpointSnitch
--        Partitioner: org.apache.cassandra.dht.Murmur3Partitioner
--        Schema versions:
--                e53a2a45-62b1-344b-8000-03fd38bea00b: [10.138.32.232, 10.138.32.79, 10.138.32.81, 10.138.32.230, 10.138.32.231]

--               d759c3dd-9e6c-31cf-89b9-a99a7921c54a: [10.138.32.78, 10.138.32.76, 10.138.32.77, 10.138.32.80]
				