# Make sure the query file is longer than 10 lines, to be safe
echo 'Checking query_out file contains more than 10 lines'
if [[ $(wc -l </tmp/query_out) -ge 10 && $$(wc -l </tmp/updatequery) ]]
then
    # Step 5: Drop the column retry_count from the original table
	echo 'Droping the retry count text field'
    cqlsh 10.138.32.80 -u cassandra -p cassandra -k alltrade_poc -e 'ALTER TABLE alltrade_poc.local_service_requests_new6 DROP retry_count' --request-timeout=20000
	echo 'Dropped retry count text'
	
    # Step 6: Create a new column with name retry_count and type as int in the original table
	echo 'Creating the retry count integer field'
    cqlsh 10.138.32.80 -u cassandra -p cassandra -k alltrade_poc -e 'ALTER TABLE alltrade_poc.local_service_requests_new6 ADD retry_count int' --request-timeout=20000
	echo 'Created retry count integer'
	
fi