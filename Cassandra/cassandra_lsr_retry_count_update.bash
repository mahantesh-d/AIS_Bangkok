#!/bin/bash

# Step 1: Add a new alternate column
echo 'Creating the retry_count_int as integer datatype'
cqlsh 10.138.32.80 -u cassandra -p cassandra -k alltrade_poc -e "ALTER TABLE alltrade_poc.local_service_requests_new6 ADD retry_count_int int" --request-timeout=20000


# Step 2: Take a backup of the whole table
echo 'Taking the backup of the orginal table'
cqlsh 10.138.32.80 -u cassandra -p cassandra -k alltrade_poc -e "COPY local_service_requests_new6 TO '/tmp/table_data_backup.csv' WITH DELIMITER='|'" --request-timeout=20000

# Step 3: Create a reference file with retry_count and pk values so we can use this for Step . 
echo 'Creating the file query in tmp containg the select of retry_count and pk'
cat > /tmp/query <<EOF
SELECT retry_count,local_service_requests_new6_pk from alltrade_poc.local_service_requests_new6;
EOF

# Step 4: Run the query from the previous step 
echo 'Storing the output of query file in /tmp/query_out'
cqlsh 10.138.32.80 -u cassandra -p cassandra -k alltrade_poc -f /tmp/query > /tmp/query_out --request-timeout=20000


# Step 5: Generate the retry count query file
echo 'Creating the update queries'
cat /tmp/query_out | tail -n+4 | head -n-2 | awk '{ gsub("[a-zA-z].*", "0" ,$1); print "UPDATE alltrade_poc.local_service_requests_new6 set retry_count = ",$1,"WHERE local_service_requests_new6_pk = " $3  }' | sed 's/$/;/' > /tmp/updatequery
echo 'Created update queries'

# Make sure the query file is longer than 10 lines, to be safe
#echo 'Checking query_out file contains more than 10 lines'
#if [[ $(wc -l </tmp/query_out) -ge 10 ]] 
#then

    # Step 5: Drop the column retry_count from the original table
#	echo 'Droping the retry count text field'
#    cqlsh 10.138.32.80 -u cassandra -p cassandra -k alltrade_poc -e 'ALTER TABLE alltrade_poc.local_service_requests_new6 DROP retry_count' --request-timeout=20000
#	echo 'Dropped retry count text'
	
    # Step 6: Create a new column with name retry_count and type as int in the original table
#	echo 'Creating the retry count integer field'
#    cqlsh 10.138.32.80 -u cassandra -p cassandra -k alltrade_poc -e 'ALTER TABLE alltrade_poc.local_service_requests_new6 ADD retry_count int' --request-timeout=20000
#	echo 'Created retry count integer'
	
#fi