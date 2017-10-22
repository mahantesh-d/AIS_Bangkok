#-----------------------------GTM Master-------------------------------------------------------------------------
cd "$(ps aux | grep gtm | awk '{print $13}' | head -1)" 
awk -F\= '{gsub(/"/,"",$2);print $1 " = " $2}' *.conf | sed  's/^ =//' | grep -vP "(#|'^$')" | sed '/^\s*$/d'

#-----------------------------GTM Slave-------------------------------------------------------------------------
ssh serveradm@10.138.32.75 "cd "$(ps aux | grep gtm | awk '{print $13}' | head -1)";awk -F\= '{gsub(/"/,"",$2);print $1 " = " $2}' *.conf | sed  's/^ =//' | grep -vP "(#|'^$')" | sed '/^\s*$/d'"


ssh serveradm@10.138.32.75 "cd '$(ps aux | grep gtm | awk '{print $13}' | head -1)'"