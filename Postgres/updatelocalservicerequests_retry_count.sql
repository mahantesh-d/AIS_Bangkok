------------------------------------------------------------------------------------
-- Start				
------------------------------------------------------------------------------------

ALTER TABLE local_service_requests_new8 add retry_count_int int; -- CREATE the new Column with type int

SELECT MAX(local_service_requests_new8_pk) from local_service_requests_new8; -- note the primary_key reference 

UPDATE local_service_requests_new8
	SET retry_count_int = (
				CASE WHEN (retry_count ~ '^[0-9][a-zA-Z].*') OR (retry_count !~ E'^[^a-zA-Z].*') THEN 0::int
				ELSE retry_count::int
				END);
					
ALTER TABLE local_service_requests_new8 RENAME retry_count to retry_count_ori_text; 		
ALTER TABLE local_service_requests_new8 RENAME retry_count_int to retry_count;

UPDATE local_service_requests_new8
	SET retry_count = (
				CASE WHEN (retry_count_ori_text ~ '^[0-9][a-zA-Z].*') OR (retry_count_ori_text !~ E'^[^a-zA-Z].*') THEN 0::int
				ELSE retry_count_ori_text::int
				END) WHERE local_service_requests_pk > <'ID that was copied from query2'>;

------------------------------------------------------------------------------------
-- Finished				
------------------------------------------------------------------------------------				
				
				
				
------------------------------------------------------------------------------------
-- Rollback				
------------------------------------------------------------------------------------
ALTER TABLE local_service_requests_new8 RENAME retry_count to retry_count_int;
ALTER TABLE local_service_requests_new8 RENAME retry_count_ori_text to retry_count ;










----------------------------------------------------------------------------------------------------------------------------
UPDATE testtexttoint
	SET id1 = (
					CASE WHEN (id ~ '^[0-9][a-zA-Z].*') OR (id !~ E'^[^a-zA-Z].*') THEN 0::int
					ELSE id::int
					END);
