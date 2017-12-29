#SELECT the data from text column and primary key
cat > /tmp/query <<EOF
SELECT roll,id from all_trade.test1;
EOF

#Add the new column with datatype int
cqlsh 10.138.32.80 -u cassandra -p cassandra -k all_trade -e "ALTER TABLE test1 ADD roll_intn int"

#Prepare update statments
cqlsh 10.138.32.80 -u cassandra -p cassandra -k all_trade -f /tmp/query | grep -v "-" | awk '{ gsub("[a-zA-z].*", "0" ,$1); print "UPDATE all_trade.test1 set roll_intn = ",$1,"WHERE id = " $3  }' | tail -n+3 | head -n-2 | sed 's/$/;/' > /tmp/updatequery

#Update the new column 
cqlsh 10.138.32.80 -u cassandra -p cassandra -f /tmp/updatequery