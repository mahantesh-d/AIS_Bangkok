--Check the Prepared TRANSACTION
select * from pg_prepared_statements;

--Check the TRANSACTION
select * from pg_prepared_xacts;

-- Connection Check(Active, idle)
SELECT count(*) from pg_stat_activity

--Kill The Idle Connection
SELECT query, pid, state, (SELECT pg_terminate_backend(pid)) as killed from pg_stat_activity WHERE state LIKE 'idle';
SELECT query, pid, state, (SELECT pg_cancel_backend(pid)) as killed from pg_stat_activity WHERE state LIKE 'idle';

--Check the idle Connection
SELECT query, pid, state from pg_stat_activity WHERE state LIKE 'idle';

--Kill the PID Which are idle more than 5 mins
select pg_terminate_backend(pid) from pg_stat_activity where datname = 'newdb' AND pid <> pg_backend_pid()
AND state_change < current_timestamp - interval '5' minute;

--Kill the Query with PID
SELECT pg_terminate_backend(8514);

--
SELECT relation, transactionid, pid, mode, granted, relname
FROM pg_locks
INNER JOIN pg_stat_user_tables
ON pg_locks.transactionid::varchar = pg_stat_user_tables.relid::varchar;
WHERE pg_locks.pid='pid'

-- Copy the column to column
UPDATE table SET columnB = columnA;   

-- postgress settings
SELECT * pg_settings; 

-- reload the configuration
SELECT pgxc_pool_reload();
 
-- Check the Size of the Database 
SELECT
    pg_database.datname,
    pg_size_pretty(pg_database_size(pg_database.datname)) AS size
    FROM pg_database;

-- Check the size of the TABLE
SELECT
   relname as "Table",
   pg_size_pretty(pg_total_relation_size(relid)) As "Size",
   pg_size_pretty(pg_total_relation_size(relid) - pg_relation_size(relid)) as "External Size"
   FROM pg_catalog.pg_statio_user_tables where relname = 'local_service_requests_new8' ORDER BY pg_total_relation_size(relid) DESC;
 
--Check the size of all Objects
SELECT
   relname AS objectname,
   relkind AS objecttype,
   reltuples AS "#entries", pg_size_pretty(relpages::bigint) AS size
   FROM pg_class
   WHERE relpages >= 8
   ORDER BY relpages DESC;
   
--Update the column using the CASE
UPDATE local_service_requests_new8
	SET order_info_error_date_time = (
					CASE WHEN order_info_error_date like '______________+____' THEN to_timestamp(order_info_error_date, 'YYYYMMDDHH24MISS')
					ELSE NULL
					END);
					
--Loading the Data into table
COPY tmp_product_master from '/tmp/productmaster.csv' delimiter ',' CSV HEADER;

COPY company (company_key0, company_name_data, company_address_data, sale_organize_data, prefix_company_name_data, active_flag_data, faxno_data, telno_data, taxno_data, create_by_data, create_datetime_data, update_by_data, update_datetime_key1) from '/tmp/postgresdataencode/company.txt' with delimiter '|' CSV HEADER;

--Creating the DATABASE
CREATE DATABASE "alltrade"
  ENCODING 'UTF8'
  LC_COLLATE = 'en_US.UTF-8'
  LC_CTYPE = 'en_US.UTF-8';
  
--Taking dump with multiple threads
time pg_dump -p 30001 -d all_trade -Fd -j 2 -t local_service_requests_new8 -a -f /tmp/stock_adjustment_arch/


time pg_dump -p 30001 -d all_trade -g -Fd -j 2 -t stock_adjustment -f /tmp/stock_adjustment_arch/
pg_restore -p 30001 -d all_trade -Fd -j 2 -t stock_adjustment -f /tmp/stock_adjustment_arch/


SELECT *
  FROM pg_locks l
  JOIN pg_class t ON l.relation = t.oid AND t.relkind = 'r'
 WHERE t.relname = 'cpc_comercial_product';

chmod -R 0777 /app/data/
chmod -R 0777 /app/commitlog/

