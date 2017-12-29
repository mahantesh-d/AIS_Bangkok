select count(*),retry_count from local_service_requests_new8 group by retry_count;


select count(*),retry_count from local_service_requests_new8 where retry_count ~ E'^[^a-zA-Z].*' group by retry_count;


select * from testtexttoint where id ~ E'^[^a-zA-Z].*';

select * from testtexttoint where id ~ '^[0-9][a-zA-Z].*' OR id !~ E'^[^a-zA-Z].*';

UPDATE testtexttoint
	SET id1 = (
					CASE WHEN (id ~ '^[0-9][a-zA-Z].*') OR (id !~ E'^[^a-zA-Z].*') THEN 0::int
					ELSE id::int
					END);


select * from testtexttoint where id ~ '^\d+ ?' ;

select * from testtexttoint where id !~ '[0-9]';

ALTER TABLE 

UPDATE testtexttoint
	SET id1 = (
					CASE WHEN id ~ E'^[^a-zA-Z].*' THEN id::int
					ELSE 0::int
					END);
					
					
ALTER TABLE local_service_requests_new8 add retry_count_int int;

SELECT local_service_requests_pk from local_service_requests_new8; -- note the primary_key reference

UPDATE local_service_requests_new8
	SET retry_count_int = (
					CASE WHEN retry_count ~ E'^[^a-zA-Z].*' THEN retry_count::int
					ELSE 0::int
					END);					
		
		-------------------------------------------------------
		
ALTER TABLE local_service_requests_new8 RENAME retry_count to retry_count_ori_text; 		
ALTER TABLE local_service_requests_new8 RENAME retry_count_int to retry_count;

UPDATE local_service_requests_new8
	SET retry_count_int = (
					CASE WHEN retry_count ~ E'^[^a-zA-Z].*' THEN retry_count::int
					ELSE 0::int
					END) WHERE ;					


--ROLLBACK					

ALTER TABLE local_service_requests_new8 RENAME retry_count to retry_count_int;

ALTER TABLE local_service_requests_new8 RENAME retry_count_ori_text to retry_count ;
 		
