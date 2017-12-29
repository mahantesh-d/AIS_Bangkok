ALTER TABLE local_service_requests_new8 ADD lucene TEXT;
CREATE CUSTOM INDEX retry_count_idx ON  local_service_requests_new8 (lucene) 
USING 'com.stratio.cassandra.lucene.Index' 
WITH OPTIONS = {
   'refresh_seconds'    : '60',
   'schema' : '{ default_analyzer : "English",
     fields : {
            retry_count  : {type : "string"}
       }}     
'};

 SELECT retry_count FROM local_service_requests_new8 WHERE lucene = '{query : {type  : "regexp", field : "retry_count", value : "[a-zA-Z].*"}}';
 
 SELECT retry_count, local_service_requests_new8_pk  FROM local_service_requests_new8 WHERE lucene = '{query : {type  : "regexp", field : "retry_count", value : "[a-zA-Z].*"}}';
 
---------------------------------------------------------------------------------------------------------------------------------------------------------------- 
 
ALTER TABLE test1 ADD lucene TEXT;
CREATE CUSTOM INDEX roll_idx ON  test1 (lucene) 
USING 'com.stratio.cassandra.lucene.Index' 
WITH OPTIONS = {
   'refresh_seconds'    : '60',
   'schema' : '{ default_analyzer : "English",
     fields : {
            test1  : {type : "string"}
       }}     
'};

SELECT id, roll  FROM test1 WHERE lucene = '{query : {type  : "regexp", field : "roll", value : "[a-zA-Z].*"}}';
