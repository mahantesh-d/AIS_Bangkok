>/tmp/setoftextcol
echo "sub_stock_daily_detail**************************************************************"  >> /tmp/setoftextcol
echo -e $(cqlsh -p cassandra -u cassandra 10.138.32.76 -k all_trade -e "DESCRIBE sub_stock_daily_detail" | grep 'set<text>' | sed 's/ set<text>,/_new list<text>;/' )| tr \; \\n | while read line ; do echo -e "ALTER TABLE sub_stock_daily_detail ADD $line;"; done   >> /tmp/setoftextcol
echo "sub_stock_detail_transfer**************************************************************"  >> /tmp/setoftextcol
echo -e $(cqlsh -p cassandra -u cassandra 10.138.32.76 -k all_trade -e "DESCRIBE sub_stock_detail_transfer" | grep 'set<text>' | sed 's/ set<text>,/_new list<text>;/' )| tr \; \\n | while read line ; do echo -e "ALTER TABLE sub_stock_detail_transfer ADD $line;"; done   >> /tmp/setoftextcol
echo "transaction_log**************************************************************"  >> /tmp/setoftextcol
echo -e $(cqlsh -p cassandra -u cassandra 10.138.32.76 -k all_trade -e "DESCRIBE transaction_log" | grep 'set<text>' | sed 's/ set<text>,/_new list<text>;/' )| tr \; \\n | while read line ; do echo -e "ALTER TABLE transaction_log ADD $line;"; done   >> /tmp/setoftextcol
echo "order_transfer**************************************************************"  >> /tmp/setoftextcol
echo -e $(cqlsh -p cassandra -u cassandra 10.138.32.76 -k all_trade -e "DESCRIBE order_transfer" | grep 'set<text>' | sed 's/ set<text>,/_new list<text>;/' )| tr \; \\n | while read line ; do echo -e "ALTER TABLE order_transfer ADD $line;"; done   >> /tmp/setoftextcol
echo "check_stock_detail**************************************************************" >> /tmp/setoftextcol
echo -e $(cqlsh -p cassandra -u cassandra 10.138.32.76 -k all_trade -e "DESCRIBE check_stock_detail" | grep 'set<text>' | sed 's/ set<text>,/_new list<text>;/' )| tr \; \\n | while read line ; do echo -e "ALTER TABLE check_stock_detail ADD $line;"; done   >> /tmp/setoftextcol
echo "print_history_detail**************************************************************" >> /tmp/setoftextcol
echo -e $(cqlsh -p cassandra -u cassandra 10.138.32.76 -k all_trade -e "DESCRIBE print_history_detail" | grep 'set<text>' | sed 's/ set<text>,/_new list<text>;/' )| tr \; \\n | while read line ; do echo -e "ALTER TABLE print_history_detail ADD $line;"; done   >> /tmp/setoftextcol
echo "sale_out_detail**************************************************************" >> /tmp/setoftextcol
echo -e $(cqlsh -p cassandra -u cassandra 10.138.32.76 -k all_trade -e "DESCRIBE sale_out_detail" | grep 'set<text>' | sed 's/ set<text>,/_new list<text>;/' )| tr \; \\n | while read line ; do echo -e "ALTER TABLE sale_out_detail ADD $line;"; done   >> /tmp/setoftextcol
echo "local_service_requests_new8**************************************************************" >> /tmp/setoftextcol
echo -e $(cqlsh -p cassandra -u cassandra 10.138.32.76 -k all_trade -e "DESCRIBE local_service_requests_new8" | grep 'set<text>' | sed 's/ set<text>,/_new list<text>;/' )| tr \; \\n | while read line ; do echo -e "ALTER TABLE local_service_requests_new8 ADD $line;"; done   >> /tmp/setoftextcol
echo "transfer_out_mismatch**************************************************************" >> /tmp/setoftextcol
echo -e $(cqlsh -p cassandra -u cassandra 10.138.32.76 -k all_trade -e "DESCRIBE transfer_out_mismatch" | grep 'set<text>' | sed 's/ set<text>,/_new list<text>;/' )| tr \; \\n | while read line ; do echo -e "ALTER TABLE transfer_out_mismatch ADD $line;"; done   >> /tmp/setoftextcol
echo "stock_adjustment**************************************************************" >> /tmp/setoftextcol
echo -e $(cqlsh -p cassandra -u cassandra 10.138.32.76 -k all_trade -e "DESCRIBE stock_adjustment" | grep 'set<text>' | sed 's/ set<text>,/_new list<text>;/' )| tr \; \\n | while read line ; do echo -e "ALTER TABLE stock_adjustment ADD $line;"; done   >> /tmp/setoftextcol
echo "obtain_detail**************************************************************" >> /tmp/setoftextcol
echo -e $(cqlsh -p cassandra -u cassandra 10.138.32.76 -k all_trade -e "DESCRIBE obtain_detail" | grep 'set<text>' | sed 's/ set<text>,/_new list<text>;/' )| tr \; \\n | while read line ; do echo -e "ALTER TABLE obtain_detail ADD $line;"; done   >> /tmp/setoftextcol
echo "stock_brought_forward**************************************************************" >> /tmp/setoftextcol
echo -e $(cqlsh -p cassandra -u cassandra 10.138.32.76 -k all_trade -e "DESCRIBE stock_brought_forward" | grep 'set<text>' | sed 's/ set<text>,/_new list<text>;/' )| tr \; \\n | while read line ; do echo -e "ALTER TABLE stock_brought_forward ADD $line;"; done   >> /tmp/setoftextcol
echo "history**************************************************************" >> /tmp/setoftextcol
echo -e $(cqlsh -p cassandra -u cassandra 10.138.32.76 -k all_trade -e "DESCRIBE history" | grep 'set<text>' | sed 's/ set<text>,/_new list<text>;/' )| tr \; \\n | while read line ; do echo -e "ALTER TABLE history ADD $line;"; done   >> /tmp/setoftextcol
echo "request_goods**************************************************************" >> /tmp/setoftextcol
echo -e $(cqlsh -p cassandra -u cassandra 10.138.32.76 -k all_trade -e "DESCRIBE request_goods" | grep 'set<text>' | sed 's/ set<text>,/_new list<text>;/' )| tr \; \\n | while read line ; do echo -e "ALTER TABLE request_goods ADD $line;"; done   >> /tmp/setoftextcol
echo "reserve**************************************************************" >> /tmp/setoftextcol
echo -e $(cqlsh -p cassandra -u cassandra 10.138.32.76 -k all_trade -e "DESCRIBE reserve" | grep 'set<text>' | sed 's/ set<text>,/_new list<text>;/' )| tr \; \\n | while read line ; do echo -e "ALTER TABLE reserve ADD $line;"; done   >> /tmp/setoftextcol
#sed -i 's/ set<text>/_new list<text>/g' /tmp/setoftextcol