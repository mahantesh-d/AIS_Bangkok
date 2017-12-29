cqlsh 10.138.32.80 -u cassandra -p cassandra -f /tmp/query | grep -v "-" | awk '{print $1 , $3}' | tail -n+3 | head -n-2


cqlsh 10.138.32.80 -u cassandra -p cassandra -f /tmp/query | grep -v "-" | awk '{print $1 , $3}' | tail -n+3 | head -n-2


cqlsh 10.138.32.80 -u cassandra -p cassandra -f /tmp/query | grep -v "-" | awk '{ gsub("[a-zA-z]", "0" ,$3); print $1, $3 }' | tail -n+3 | head -n-2


cqlsh 10.138.32.80 -u cassandra -p cassandra -f /tmp/query | grep -v "-" | awk '{ gsub("[a-zA-z].*", "0" ,$1); print "UPDATE test1 set roll_intn = '\''"$1"'\''" ,"WHERE id = " $3  }' | tail -n+3 | head -n-2 | sed 's/$/;/'





SELECT roll,id  FROM all_trade.test1 WHERE lucene = '{query : {type  : "regexp", field : "roll", value : "[a-zA-Z].*"}}';

cqlsh 10.138.32.80 -u cassandra -p cassandra -f /tmp/query | grep -v "-" | awk '{ gsub("[a-zA-z].*", "0" ,$1); print "UPDATE all_trade.test1 set roll_intn = ",$1,"WHERE id = " $3  }' | tail -n+3 | head -n-2 | sed 's/$/;/' > /tmp/updatequery


cqlsh 10.138.32.80 -u cassandra -p cassandra -f /tmp/updatequery



cqlsh 10.138.32.80 -u cassandra -p cassandra -k all_trade -e "ALTER TABLE test1 ADD roll_intn int"



cat > /tmp/query <<EOF
SELECT roll,id from all_trade.test1;
EOF

cqlsh 10.138.32.80 -u cassandra -p cassandra -k all_trade -e "ALTER TABLE test1 ADD roll_intn int"

cqlsh 10.138.32.80 -u cassandra -p cassandra -k all_trade -f /tmp/query | grep -v "-" | awk '{ gsub("[a-zA-z].*", "0" ,$1); print "UPDATE all_trade.test1 set roll_intn = ",$1,"WHERE id = " $3  }' | tail -n+3 | head -n-2 | sed 's/$/;/' > /tmp/updatequery

cqlsh 10.138.32.80 -u cassandra -p cassandra -f /tmp/updatequery