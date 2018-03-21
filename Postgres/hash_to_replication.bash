#Check the D40 tables for the Hash Distribution
	psql -p 20004 all_trade -c '\d' | awk '{print $3}' | head -n -2 | tail -n+4 | sed 's/^/\\d+ /g' | grep -vP "(v_|_seq|cpc_)" > /tmp/listtables
	psql -p 20004 all_trade -f '/tmp/listtables' | grep -P "(Table|Distribute)" | awk '{$2=$2};1' | sed 'N;s/\n/ /' | grep -vP "(REPLICATION|_pk)" | sed 's#Table "public.#ALTER TABLE #g' | sed 's/[\"].*$/ DISTRIBUTE BY REPLICATION/g' > /tmp/altertable
	psql -p 20004 all_trade -f '/tmp/altertable'
	