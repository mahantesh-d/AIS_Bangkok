echo "**************************8***************PostgresXl Pgxctcl Conf configuration*************************************************************************"
function help() {

        echo "Please specify the correct path from below"
        locate pgxc_ctl.conf
		exit 1;
}

if [ $# -lt 1 ]
then
        help
fi
echo "---------------------------------------------------------GTM Master-------------------------------------------------------------------------------------"
gtm_master="$(cat $1 | grep gtmMasterServer | cut -d "=" -f2 | cut -d "#" -f1)"
echo -e "GTM Master: $gtm_master"
gtm_master_port="$(cat $1 | grep gtmMasterPort | cut -d "=" -f2 | cut -d "#" -f1)"
echo -e "GTM Master Port: $gtm_master_port"
echo "---------------------------------------------------------GTM Slave--------------------------------------------------------------------------------------"
gtm_slave="$(cat $1 | grep gtmSlaveServer | cut -d "=" -f2 | cut -d "#" -f1)"
echo -e "GTM Slave: $gtm_slave"
gtm_slave_port="$(cat $1 | grep gtmSlavePort | cut -d "=" -f2 | cut -d "#" -f1)"
echo -e "GTM Slave Port: $gtm_slave_port"
echo "---------------------------------------------------------GTM Proxy--------------------------------------------------------------------------------------"
inc=1
gtm_proxy=$(cat $1 | grep gtmProxyServers | cut -d "(" -f2 | cut -d ")" -f1)                           
for gtm in $gtm_proxy; do eval "gtm_proxy$inc=$gtm";let "inc+=1"; done
echo -e "GTM Proxy1: $gtm_proxy1" 
echo -e "GTM Proxy2: $gtm_proxy2"                                 
inc=1
gtm_proxy_ports=$(cat $1 | grep gtmProxyPorts | cut -d "(" -f2 | cut -d ")" -f1) 
for gtmpport in $gtm_proxy_ports; do eval "gtm_proxy_ports$inc=$gtmpport";let "inc+=1"; done                                       
echo -e "GTM Proxy Ports1: $gtm_proxy_ports1" 
echo -e "GTM Proxy Ports2: $gtm_proxy_ports2"
echo "----------------------------------------------------------Coordinator-----------------------------------------------------------------------------------"
inc=1
coordinator=$(cat $1 | grep coordMasterServer | cut -d "(" -f2 | cut -d ")" -f1)
for coord in $coordinator; do eval "coordinator$inc=$coord";let "inc+=1"; done                                                   
echo -e "Coordinator1: $coordinator1"
echo -e "Coordinator2: $coordinator2"
inc=1
coordinator_ports=$(cat $1 | grep coordPorts | cut -d "(" -f2 | cut -d ")" -f1)                 
for coordport in $coordinator_ports; do eval "coordinator_ports$inc=$coordport";let "inc+=1"; done                                        
echo -e "Coordinator Port1: $coordinator_ports1"
echo -e "Coordinator Port2: $coordinator_ports2"
inc=1
coordinator_pooler_ports=$(cat $1 | grep poolerPorts | cut -d "(" -f2 | cut -d ")" -f1)
for coordpport in $coordinator_pooler_ports; do eval "coordinator_pooler_ports$inc=$coordpport";let "inc+=1"; done                                 
echo -e "Coordinator Pooler Port1: $coordinator_pooler_ports1"
echo -e "Coordinator Pooler Port2: $coordinator_pooler_ports2"
echo "-----------------------------------------------------------Datanode Master------------------------------------------------------------------------------"
inc=1
datanode=$(cat $1 | grep datanodeMasterServers | cut -d "(" -f2 | cut -d ")" -f1)                      
for data in $datanode; do eval "datanode$inc=$data";let "inc+=1"; done        
echo -e "Datanode1: $datanode1"
echo -e "Datanode2: $datanode2"
inc=1
datanode_ports=$(cat $1 | grep datanodePorts | cut -d "(" -f2 | cut -d ")" -f1)                    
for dataport in $datanode_ports; do eval "datanode_ports$inc=$dataport";let "inc+=1"; done                                           
echo -e "Datanode Port1: $datanode_ports1"
echo -e "Datanode Port2: $datanode_ports2"
inc=1
datanode_pooler_ports=$(cat $1 | grep datanodePoolerPorts | cut -d "(" -f2 | cut -d ")" -f1)                
for datapport in $datanode_pooler_ports; do eval "datanode_pooler_ports$inc=$datapport";let "inc+=1"; done                
echo -e "Datanode Pooler Port1: $datanode_pooler_ports1"
echo -e "Datanode Pooler Port2: $datanode_pooler_ports2"
echo "------------------------------------------------------------Datanode Slave------------------------------------------------------------------------------"
inc=1
datanode_slave=$(cat $1 | grep datanodeSlaveServers | cut -d "(" -f2 | cut -d ")" -f1)
for datasl in $datanode_slave; do eval "datanode_slave$inc=$datasl";let "inc+=1"; done
echo -e "Datanode Slave1: $datanode_slave1"
echo -e "Datanode Slave2: $datanode_slave2"
inc=1
datanode_slave_ports=$(cat $1 | grep datanodeSlavePorts | cut -d "(" -f2 | cut -d ")" -f1)                   
for dataslport in $datanode_slave_ports; do eval "datanode_slave_ports$inc=$dataslport";let "inc+=1"; done                                      
echo -e "Datanode Slave Port1: $datanode_slave_ports1"
echo -e "Datanode Slave Port2: $datanode_slave_ports2"
inc=1
datanode_slave_pooler_ports=$(cat $1 | grep datanodeSlavePoolerPorts | cut -d "(" -f2 | cut -d ")" -f1)            
for dataslpport in $datanode_slave_pooler_ports; do eval "datanode_slave_pooler_ports$inc=$dataslpport";let "inc+=1"; done
echo -e "Datanode Slave Pooler Port1: $datanode_slave_pooler_ports1"
echo -e "Datanode Slave Pooler Port2: $datanode_slave_pooler_ports2"
echo "--------------------------------------------------------------------------------------------------------------------------------------------------------"