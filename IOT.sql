--IOT RDB Enviroment
	--USER
	--VIEW
	--TABLE
	--STORE PROCEDURE(VERIFY AGAIN)
	--INDEXES
	--DATABASE
	
--1. CREATE the user TORO this user created in porduction enviroment as serveradm
	CREATE USER toro;
	GRANT serveradm to toro;

--2. DROP the unwanted table of localServiceRequests and others, helps to release the disk space
	DROP TABLE local_service_requests;
	DROP TABLE local_service_requests_new;
	DROP TABLE local_service_requests_new10;
	DROP TABLE local_service_requests_new11;
	DROP TABLE local_service_requests_new2;
	DROP TABLE local_service_requests_new3;
	DROP TABLE local_service_requests_new4;
	DROP TABLE local_service_requests_new5;
	DROP TABLE local_service_requests_new6;
	DROP TABLE local_service_requests_new7;
	DROP TABLE local_service_requests_new9;
	DROP TABLE local_service_requests_new99;
	DROP TABLE arrayind;
	DROP TABLE indexcheck;
	DROP TABLE hector_query_fail;
	DROP TABLE test;
	DROP TABLE textjson;
	DROP TABLE timetest;
	DROP TABLE tmplocalservicerequest;
	DROP TABLE product_master_in;
	DROP TABLE route_mastertest;
	DROP TABLE setoperators;
	DROP TABLE setoperatorstext; 

--3. Drop the INDEX releases the space as these indexes are not necessary
	DROP INDEX gid_actor_local_service_requests_new8;
	DROP INDEX gid_destination_local_service_requests_new8;
	DROP INDEX gid_order_sub_type_local_service_requests_new8;
	DROP INDEX gid_request_id_local_service_requests_new8;
	DROP INDEX id_actor_local_service_requests_new8;
	DROP INDEX id_bwo_id_local_service_requests_new8;
	DROP INDEX id_destination_local_service_requests_new8;
	DROP INDEX id_order_ref_local_service_requests_new8;
	DROP INDEX id_order_sub_type_local_service_requests_new8
	DROP INDEX id_pgz_record_type_local_service_requests_new8;
	DROP INDEX id_pgz_task_id_local_service_requests_new8;
	DROP INDEX id_request_id_local_service_requests_new8;
	DROP INDEX id_user_sys_local_service_requests_new8;
	DROP INDEX idx_local_service_requests_new8_actor;
	DROP INDEX idx_local_service_requests_new8_destination;
	DROP INDEX idx_local_service_requests_new8_order_sub_type;
	
--4. Rename the table local_service_requests_new8 to local_service_requests_new0 as in Production
	ALTER TABLE local_service_requests_new8 RENAME to local_service_requests_new0;  --Changes need in alltrade_unified.json

--5. CREATE INDEX for D30 APIs these indexes already created in the Production
	CREATE index idx_actor_order_ref_local_service_requests_new0 on local_service_requests_new0 USING btree (actor,order_ref);
	CREATE index idx_request_id_local_service_requests_new0 on local_service_requests_new0 USING btree (request_id);
	CREATE index idx_request_id_order_ref_local_service_requests_new0 on local_service_requests_new0 USING btree (request_id,order_ref);
	CREATE index idx_request_id_int_field_bwo_id_int_field_local_service_requests_new0 on local_service_requests_new0 USING btree (request_id_int_field,bwo_id_int_field);
	CREATE index idx_request_id_int_field_local_service_requests_new0 on local_service_requests_new0 USING btree (request_id_int_field);
	CREATE index idx_bwo_id_int_field_local_service_requests_new0 on local_service_requests_new0 USING btree (bwo_id_int_field);
	CREATE INDEX idx_request_no_request_goods ON request_goods USING btree (request_no);
	CREATE INDEX idx_transaction_type_order_transfer ON order_transfer USING btree (transaction_type);
	CREATE INDEX idx_transaction_type_transfer_out_mismatch ON transfer_out_mismatch USING btree (transaction_type);
	CREATE INDEX idx_transaction_type_sale_out_detail ON sale_out_detail USING btree (transaction_type);
	
--6. DROP the unwanted store procedure these stored procedure are created as trail to check the output
	DROP FUNCTION sp_worker_order1(date, date, text);
	DROP FUNCTION increment(integer);
	DROP FUNCTION sp_horizon_orion(timestamp, timestamp, text);
	DROP FUNCTION sp_horizon_orion_bso_status(timestamp, timestamp, text);
	DROP FUNCTION sp_horizon_orion_v3(timestamp, timestamp, text);
	DROP FUNCTION sp_horizon_orion_v5(timestamp, timestamp, text);

--7. Drop the existing function and Create the new with correct table refrence (local_service_requests_new0)
	DROP FUNCTION sp_horizon_orion_v4(timestamp, timestamp, text, text);
	DROP FUNCTION sp_worker_order(timestamp, timestamp, text);
	DROP FUNCTION sp_order_transaction(timestamp, timestamp, text);
	
--8. Change the table refrence in all store procedure
	--sp_worker_order(timestamp, timestamp, text)
		CREATE OR REPLACE FUNCTION sp_worker_order(
		   v_order_date_start timestamp, v_order_date_end timestamp, v_order_type text)
		RETURNS TABLE (order_type text, submitted bigint, completed bigint, cancelled bigint, open bigint) AS $$
		DECLARE 
		v_split_order_type text[] := '{}';
		BEGIN
		IF v_order_type = '' THEN
			RETURN QUERY 
			SELECT local_service_requests_new0.order_type AS order_type,
			   count(
				   CASE
					   WHEN local_service_requests_new0.order_status = 'Submitted'::text THEN 1
					   ELSE NULL::integer
				   END) AS submitted,
			   count(
				   CASE
					   WHEN local_service_requests_new0.order_status = 'Completed'::text THEN 1
					   ELSE NULL::integer
				   END) AS completed,
			   count(
				   CASE
					   WHEN local_service_requests_new0.order_status = 'Cancelled'::text THEN 1
					   ELSE NULL::integer
				   END) AS cancelled,
			   count(
				   CASE
					   WHEN local_service_requests_new0.order_status = 'Open'::text THEN 1
					   ELSE NULL::integer
				   END) AS open
			  FROM local_service_requests_new0
			 WHERE (local_service_requests_new0.order_type = 'First Activate'::text OR local_service_requests_new0.order_type = 'State Change'::text OR local_service_requests_new0.order_type = 'Monthly Fee Deduction'::text OR local_service_requests_new0.order_type = 'Product Expire'::text OR local_service_requests_new0.order_type = 'Product Reward'::text) 
			 AND  (
			(local_service_requests_new0.order_date >= v_order_date_start and 
			local_service_requests_new0.order_date <= v_order_date_end) 
			)
			 GROUP BY local_service_requests_new0.order_type;
			 
		ELSE
			v_split_order_type = string_to_array(v_order_type, ',');
			RETURN QUERY 
			SELECT local_service_requests_new0.order_type AS order_type,
			   count(
				   CASE
					   WHEN local_service_requests_new0.order_status = 'Submitted'::text THEN 1
					   ELSE NULL::integer
				   END) AS submitted,
			   count(
				   CASE
					   WHEN local_service_requests_new0.order_status = 'Completed'::text THEN 1
					   ELSE NULL::integer
				   END) AS completed,
			   count(
				   CASE
					   WHEN local_service_requests_new0.order_status = 'Cancelled'::text THEN 1
					   ELSE NULL::integer
				   END) AS cancelled,
			   count(
				   CASE
					   WHEN local_service_requests_new0.order_status = 'Open'::text THEN 1
					   ELSE NULL::integer
				   END) AS open
			  FROM local_service_requests_new0
			 WHERE (local_service_requests_new0.order_type = 'First Activate'::text OR local_service_requests_new0.order_type = 'State Change'::text OR local_service_requests_new0.order_type = 'Monthly Fee Deduction'::text OR local_service_requests_new0.order_type = 'Product Expire'::text OR local_service_requests_new0.order_type = 'Product Reward'::text) 
			 AND  (
			(local_service_requests_new0.order_date >= v_order_date_start and 
			local_service_requests_new0.order_date <= v_order_date_end) 
			) AND (
			local_service_requests_new0.order_type = ANY(v_split_order_type)	
			)
			 GROUP BY local_service_requests_new0.order_type;
			 
			END IF;

		END;
		$$ LANGUAGE plpgsql;
	--End of the sp_worker_order(timestamp, timestamp, text)

	--sp_horizon_orion_v4(timestamp, timestamp, text)
	CREATE OR REPLACE FUNCTION sp_horizon_orion_v4(
	   v_order_date_start timestamp, v_order_date_end timestamp, v_actor text, v_order_sub_type text)

			RETURNS TABLE (
				actor text, 
				order_sub_type text, 
				destination text, 
				success bigint, 
				fail bigint, 
				open bigint, 
				unexpected bigint
			) AS $$

		BEGIN
		RETURN QUERY
		SELECT 
				final.actor,
				final.order_sub_type_v,
				final.destination_v,

			   Count(CASE
					   WHEN ( bso_status_key_v = 'Success' :: text ) THEN 1
					   ELSE NULL :: INTEGER
					 END)AS Success,
			   Count(CASE
					   WHEN ( bso_status_key_v = 'Fail' :: text ) THEN 1
					   ELSE NULL :: INTEGER
					 END)AS Fail,
			   Count(CASE
					   WHEN ( bso_status_key_v = 'Open' :: text ) THEN 1
					   ELSE NULL :: INTEGER
					 END)AS Open,
			   Count(CASE
					   WHEN ( ( bso_status_key_v <> 'Success' :: text
								AND bso_status_key_v <> 'Fail' :: text
								AND bso_status_key_v <> 'Open' :: text )
							   OR bso_status_key_v IS NULL ) THEN 1
					   ELSE NULL :: INTEGER
					 END)AS Unexpected
		FROM   (
			   SELECT lsr1.destination[idx] AS destination_v,
			   bso_status_key[idx] AS bso_status_key_v,
			   unnest(lsr1.order_sub_type) as order_sub_type_v,
			   *
				FROM   (SELECT local_service_requests_new0.destination,
							   bso_status_key,
							   Generate_subscripts(local_service_requests_new0.destination, 1) idx,
							   local_service_requests_new0.order_sub_type,
							   order_date,
							   local_service_requests_new0.actor

							   FROM   local_service_requests_new0

				 WHERE (
				 (order_date >= v_order_date_start and order_date <= v_order_date_end )AND
				 ((CASE
					WHEN v_actor = '' THEN '' ELSE local_service_requests_new0.actor
						 END
				  ) = (CASE
					WHEN v_actor = '' THEN '' ELSE v_actor
						 END
				 ))
			))lsr1) final
			WHERE 
			(	CASE WHEN v_order_sub_type = '' THEN '' ELSE final.order_sub_type_v END) 
			= 
			ANY(	CASE WHEN v_order_sub_type = '' THEN ARRAY[''] ELSE string_to_array(v_order_sub_type, ',') END )
			
		GROUP  BY final.actor,final.order_sub_type_v,final.destination_v
		ORDER BY final.actor,final.order_sub_type_v,final.destination_v
		;
		END;
	$$ LANGUAGE plpgsql;
	--End of the sp_horizon_orion_v4(timestamp, timestamp, text)
	--sp_order_transaction(timestamp, timestamp, text)
		CREATE OR REPLACE FUNCTION sp_order_transaction(
		   v_order_date_start timestamp, v_order_date_end timestamp, v_order_type text)
		RETURNS TABLE (order_type text, submitted bigint, completed bigint, cancelled bigint, open bigint) AS $$
		DECLARE 
		v_split_order_type text[] := '{}';
		BEGIN
		IF v_order_type = '' THEN
			RETURN QUERY 
			SELECT local_service_requests_new0.order_type AS order_type,
			   count(
				   CASE
					   WHEN local_service_requests_new0.order_status = 'Submitted'::text THEN 1
					   ELSE NULL::integer
				   END) AS submitted,
			   count(
				   CASE
					   WHEN local_service_requests_new0.order_status = 'Completed'::text THEN 1
					   ELSE NULL::integer
				   END) AS completed,
			   count(
				   CASE
					   WHEN local_service_requests_new0.order_status = 'Cancelled'::text THEN 1
					   ELSE NULL::integer
				   END) AS cancelled,
			   count(
				   CASE
					   WHEN local_service_requests_new0.order_status = 'Open'::text THEN 1
					   ELSE NULL::integer
				   END) AS open
			  FROM local_service_requests_new0
			 WHERE (local_service_requests_new0.order_type = 'Change Promotion'::text OR
					local_service_requests_new0.order_type = 'Change Service'::text OR 
					local_service_requests_new0.order_type = 'New Registration'::text OR 
					local_service_requests_new0.order_type = 'Re-New'::text OR 
					local_service_requests_new0.order_type = 'Preparation'::text OR
					local_service_requests_new0.order_type = 'Pre-paid Iden'::text OR
					local_service_requests_new0.order_type = 'Cancel RSA Flag'::text OR
					local_service_requests_new0.order_type = 'Call Management'::text) 
			 AND  (
					(local_service_requests_new0.order_date >= v_order_date_start and 
					local_service_requests_new0.order_date <= v_order_date_end) 
					)
			 GROUP BY local_service_requests_new0.order_type;
			 
		ELSE
			v_split_order_type = string_to_array(v_order_type, ',');
			RETURN QUERY 
			SELECT local_service_requests_new0.order_type AS order_type,
			   count(
				   CASE
					   WHEN local_service_requests_new0.order_status = 'Submitted'::text THEN 1
					   ELSE NULL::integer
				   END) AS submitted,
			   count(
				   CASE
					   WHEN local_service_requests_new0.order_status = 'Completed'::text THEN 1
					   ELSE NULL::integer
				   END) AS completed,
			   count(
				   CASE
					   WHEN local_service_requests_new0.order_status = 'Cancelled'::text THEN 1
					   ELSE NULL::integer
				   END) AS cancelled,
			   count(
				   CASE
					   WHEN local_service_requests_new0.order_status = 'Open'::text THEN 1
					   ELSE NULL::integer
				   END) AS open
			  FROM local_service_requests_new0
			 WHERE (local_service_requests_new0.order_type = 'Change Promotion'::text OR
					local_service_requests_new0.order_type = 'Change Service'::text OR 
					local_service_requests_new0.order_type = 'New Registration'::text OR 
					local_service_requests_new0.order_type = 'Re-New'::text OR 
					local_service_requests_new0.order_type = 'Preparation'::text OR
					local_service_requests_new0.order_type = 'Pre-paid Iden'::text OR
					local_service_requests_new0.order_type = 'Cancel RSA Flag'::text OR
					local_service_requests_new0.order_type = 'Call Management'::text) 
			 AND  (
			(local_service_requests_new0.order_date >= v_order_date_start and 
			local_service_requests_new0.order_date <= v_order_date_end) 
			) AND (
			local_service_requests_new0.order_type = ANY(v_split_order_type)	
			)
			 GROUP BY local_service_requests_new0.order_type;
			 
			END IF;

		END;
		$$ LANGUAGE plpgsql;
	--End of the sp_order_transaction(timestamp, timestamp, text)
	
--9. DROP the VIEW which are not neccessary, these are trail views created to check the output
	DROP VIEW locationshiptodetail;
	DROP VIEW substock;
	DROP VIEW worker_order;
	DROP VIEW v_test_test2;
	DROP VIEW v_test_test;
	DROP VIEW v_product_master_new;
	DROP VIEW v_product_master_rep;
	DROP VIEW v_product_master1;
	DROP VIEW locationshiptodetail;
	DROP VIEW substock;
	DROP VIEW v_device_specification1;
	DROP VIEW v_location_ship_to_detail;
	
--10. Rename the VIEW
	ALTER VIEW config_route_group_detail RENAME TO v_config_route_group_detail;  	--Changes need in alltrade_unified.json
	ALTER VIEW v_location_ship_to_detail1 RENAME TO v_location_ship_to_detail;  	--Changes need in alltrade_unified.json

--11. Delete the DATABASE alltrade which is already exists
	DROP DATABASE alltrade;
	
--12. CHANGE the DATABASE name as in Production
	ALTER DATABASE all_trade rename to alltrade;				--Changes need in alltrade_unified.json
	
	
	
	
	