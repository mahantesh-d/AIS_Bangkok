#-------------------------------------------------------------------------------
#INSTRUCTIONS
#1. psql must be in the path of the user to runs this command
#2. SYNTAX
#       pgxc_monitor -Z <node_name> -h <node_ip> -p <node_port> -U <user_name>
#               use -Z gtm for both GTM and GTM-proxy
#               use -Z node for other nodes like Coordinators and Datanodes
#-------------------------------------------------------------------------------


#Script for Coordinator
pgxc_monitor -Z node -h 10.138.32.212 -p 30001 -U serveradm
#echo "Coordinator1 Status"
#echo $?
if [ $? -eq 0 ]; then
        echo "Coordinator1 Success"
    else
        echo "Coordinator1 Fail"
    fi

#Script for DataNode1
pgxc_monitor -Z node -h 10.138.32.212 -p 40001 -U serveradm
#echo "DataNode1 Status"
#echo $?
if [ $? -eq 0 ]; then
        echo "DataNode1 Success"
    else
        echo "DataNode1 Fail"
    fi

#Script for GTM
pgxc_monitor -Z gtm -h 10.138.32.236 -p 8080
if [ $? -eq 0 ]; then
        echo "GTM Master Success"
    else
        echo "GTM Master Fail"
    fi

#Script for cassandra node status check
nodetool -h 10.138.32.76 info
if [ $? -eq 0 ]; then
       echo "success"
   else
       echo "fail"
   fi
