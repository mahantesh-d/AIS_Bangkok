\d
	--List of Relations -- Type All
	
\dt 	
	--List of Relations -- Type TABLE
	
\dv 
	--List of Relations -- TYPE VIEW

\df 
	--List of functions/store procedure

\sf 
	--Definition of functions/store procedure	
	
\d+ <table_name>/<view>
	--describe the table/definition of view

\l	
	--List of databases

\l+ <database_name>	
	--describe the database

ALTER TABLE <table_name> DISTRIBUTE BY REPLICATION;
	--Change the table hash distribution to replication
	
SELECT * FROM pgxc_node;
	--list the pgxl node details

SELECT COUNT(*), xc_node_id FROM <table_name> GROUP BY xc_node_id;
	--data distribution accross the nodes for table_name

ALTER TABLE <tablename> ADD NODE (<datanode_name>);
	--add the table to the datanode_name	
	
ALTER TABLE <tablename> DELETE NODE (<datanode_name>);
	--delete the table from the datanode_name
	
ALTER NODE <node_name> WITH (HOST='<IP>',PORT=<port>,PREFERRED,PRIMARY,TYPE='<coordinator/datanode>');
	--This will alter the <node_name> depending upon the attributes

SELECT pgxc_pool_reload();
	--This is necessary to reload the configuration whenever you alter the node configuration	
	
EXECUTE DIRECT on (<node_name>) '<query>';
	--Example: EXECUTE DIRECT on (datanode_1) 'SELECT * FROM pgxc_node';
	--This help to exceute the query on another node from current node

ALTER DATABASE <database_name> RENAME TO <new_database_name>;
	--To rename the database

ALTER DATABASE <database_name> OWNER TO <role_name> ;
	--To change the ower of the database

ALTER DATABASE <database_name> ALLOW_CONNECTIONS boolean;
	--Example ALTER DATABASE alltrade ALLOW_CONNECTIONS true;
	--This give the privilege for enabling and disabling the connection
	
CREATE DATABASE "alltrade"
  ENCODING 'UTF8'
  LC_COLLATE = 'en_US.UTF-8'
  LC_CTYPE = 'en_US.UTF-8';	
	--Create the database with collate and utf encoding
	
SELECT * FROM pg_prepared_xacts;
	--This will you gid you can roll back the prepared transaction

ROLLBACK PREPARED <gid>;
	--This is to rollback the prepared transaction

SELECT * FORM pg_stat_activity;
	--This will give the current stat of the activities going on database like query,pid,state
	
SELECT pg_terminate_backend(<pid>);
	--To terminate the query process
	
SELECT pg_cancel_backend(pid)
	--To cancel the query process	
	
SELECT query, pid, state, (SELECT pg_terminate_backend(pid)) as killed from pg_stat_activity WHERE state LIKE 'idle';
	--This will terminate the query which are idle/ you can use correct column and value in WHERE condition to terminate more than one query
	--Instead pg_terminate_backend you can also use pg_cancel_backend
	
SHOW <parameter from postgressql.conf of that node>;
	--Example: SHOW max_connections;
	--  	SHOW listen_addresses;
	--Show the current value set to that  parameter	
	
SELECT
    pg_database.datname,
    pg_size_pretty(pg_database_size(pg_database.datname)) AS size
    FROM pg_database;
	--Gives the size of all databases
	--Use datname = <database_name> in WHERE condition to get particular database size
	
SELECT
   relname as "Table",
   pg_size_pretty(pg_total_relation_size(relid)) As "Size",
   pg_size_pretty(pg_total_relation_size(relid) - pg_relation_size(relid)) as "External Size"
   FROM pg_catalog.pg_statio_user_tables ORDER BY pg_total_relation_size(relid) DESC;
	--Gives the size of all tables
	--Use relname = <table_name> in WHERE condition to get particular table size

UPDATE local_service_requests_new8
	SET order_info_error_date_time = (
					CASE WHEN order_info_error_date like '______________+____' THEN to_timestamp(order_info_error_date, 'YYYYMMDDHH24MISS')
					ELSE NULL
					END);
	--Simple demonstration of CASE used in UPDATE
	--Here I used to update the timestamp column with text column values by using the to_timestamp function, if its in proper format it will update,
	--or else it will be set to NULL

INSERT INTO <table_name> (int , text, text[], date, time, timestamp with time zone) values (<int>, '<text>', array['<text>', '<text>'], 'YYYY-MM-DD', 'HH:MM:SS', 'YYYY-MM-DD HH:MM:SS+07');	
	--Example: INSERT INTO insert_test (id , name, address, dates, times, timestamps) values (1, 'mahantesh', array['Belgaum', 'Karnataka'], '2017-10-31', 	--'16:45:20', '2017-10-02 13:11:32+07'); 	
	--This demonstrate the insert of various datat-types in database
	
CREATE SEQUENCE <sequence_name>;
	--This will create the sequence, we use this to auto increment integer column in table

ALTER TABLE <table_name> ALTER <column_name> SET DEFAULT NEXTVAL('<sequence_name>');
	--Example: ALTER TABLE inc1_test ALTER id SET DEFAULT NEXTVAL('inc_test');
	--This will add the sequence to the column for the table, the column will become autoincrement

ALTER SEQUENCE <sequence_name> RESTART <int>;
	--Example: ALTER SEQUENCE inc_test RESTART 1;	
	--This restart the sequence from the number/int mentioned in the query