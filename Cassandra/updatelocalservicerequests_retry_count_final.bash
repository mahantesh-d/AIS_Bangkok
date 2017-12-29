cqlsh 10.138.32.80 -u cassandra -p cassandra -k all_trade -e "ALTER TABLE local_service_requests_new8 ADD retry_count_int int"

cat > /tmp/query <<EOF
SELECT retry_count,local_service_requests_new8_pk from all_trade.local_service_requests_new8;
EOF

cqlsh 10.138.32.80 -u cassandra -p cassandra -k all_trade -f /tmp/query | tail -n+4 | head -n-2 | awk '{ gsub("[a-zA-z].*", "0" ,$1); print "UPDATE all_trade.local_service_requests_new8 set retry_count_int = ",$1,"WHERE local_service_requests_new8_pk = " $3  }' | sed 's/$/;/' > /tmp/updatequery

cqlsh 10.138.32.80 -u cassandra -p cassandra -f /tmp/updatequery




cqlsh 10.138.32.80 -u cassandra -p cassandra -k cassandra_test -e "ALTER TABLE local_service_requests_new8 ADD retry_count_int int"

cat > /tmp/query <<EOF
SELECT retry_count,local_service_requests_new8_pk from cassandra_test.local_service_requests_new8;
EOF

cqlsh 10.138.32.80 -u cassandra -p cassandra -k cassandra_test -f /tmp/query | tail -n+4 | head -n-2 | awk '{ gsub("[a-zA-z].*", "0" ,$1); print "UPDATE cassandra_test.local_service_requests_new8 set retry_count_int = ",$1,"WHERE local_service_requests_new8_pk = " $3  }' | sed 's/$/;/' > /tmp/updatequery

cqlsh 10.138.32.80 -u cassandra -p cassandra -f /tmp/updatequery
