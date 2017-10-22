#PostgresXl Pgxctcl Conf configuration
echo "---------------------------------------------------------GTM Master-------------------------------------------------------------------------------------"
echo $(echo "GTM_Master";cat /home/serveradm/pgxc_ctl/pgxc_ctl.conf | grep gtmMasterServer | cut -d "=" -f2 | cut -d "#" -f1)
#GTM_Master 10.138.32.25
echo $(echo "GTM Port: ";cat /home/serveradm/pgxc_ctl/pgxc_ctl.conf | grep gtmMasterPort | cut -d "=" -f2 | cut -d "#" -f1)       
#GTM Port: 20000
echo "---------------------------------------------------------GTM Slave--------------------------------------------------------------------------------------"
echo $(echo "GTM_Slave";cat /home/serveradm/pgxc_ctl/pgxc_ctl.conf | grep gtmSlaveServer | cut -d "=" -f2 | cut -d "#" -f1)      
#GTM_Slave 10.138.32.27
echo $(echo "GTM Slave Port: ";cat /home/serveradm/pgxc_ctl/pgxc_ctl.conf | grep gtmSlavePort | cut -d "=" -f2 | cut -d "#" -f1)        
#GTM Slave Port: 20001
echo "---------------------------------------------------------GTM Proxy--------------------------------------------------------------------------------------"
gtms=$(cat /home/serveradm/pgxc_ctl/pgxc_ctl.conf | grep gtmProxyServers | cut -d "(" -f2 | cut -d ")" -f1)                           
for gtm in $gtms; do echo -e "GTM_Proxy: $gtm"; done                                                                                 
#GTM_Proxy: 10.138.32.75
#GTM_Proxy: 10.138.32.77
gtmpports=$(cat /home/serveradm/pgxc_ctl/pgxc_ctl.conf | grep gtmProxyPorts | cut -d "(" -f2 | cut -d ")" -f1) 
for gtmpport in $gtmpports; do echo -e "GTM Proxy Port: $gtmpport"; done                                       
#GTM Proxy Port: 20101
#GTM Proxy Port: 20102
echo "----------------------------------------------------------Coordinator-----------------------------------------------------------------------------------"
coords=$(cat /home/serveradm/pgxc_ctl/pgxc_ctl.conf | grep coordMasterServer | cut -d "(" -f2 | cut -d ")" -f1)
for coord in $coords; do echo -e "Coordinator: $coord"; done                                                   
#Coordinator: 10.138.32.75
#Coordinator: 10.138.32.77
coordports=$(cat /home/serveradm/pgxc_ctl/pgxc_ctl.conf | grep coordPorts | cut -d "(" -f2 | cut -d ")" -f1)                 
for coordport in $coordports; do echo -e "Coordinator Port: $coordport"; done                                                           
#Coordinator Port: 30001
#Coordinator Port: 30002
coordpports=$(cat /home/serveradm/pgxc_ctl/pgxc_ctl.conf | grep poolerPorts | cut -d "(" -f2 | cut -d ")" -f1)
for coordpport in $coordpports; do echo -e "Coordinator Pooler Port: $coordpport"; done                                 
#Coordinator Pooler Port: 30011
#Coordinator Pooler Port: 30012
echo "-----------------------------------------------------------Datanode Master------------------------------------------------------------------------------"
datas=$(cat /home/serveradm/pgxc_ctl/pgxc_ctl.conf | grep datanodeMasterServers | cut -d "(" -f2 | cut -d ")" -f1)                      
for data in $datas; do echo -e "Datanode: $data"; done                                                                        
#Datanode: 10.138.32.80
#Datanode: 10.138.32.81
dataports=$(cat /home/serveradm/pgxc_ctl/pgxc_ctl.conf | grep datanodePorts | cut -d "(" -f2 | cut -d ")" -f1)                    
for dataport in $dataports; do echo -e "Datanode Port: $dataport"; done                                           
#Datanode Port: 40001
#Datanode Port: 40002
datapports=$(cat /home/serveradm/pgxc_ctl/pgxc_ctl.conf | grep datanodePoolerPorts | cut -d "(" -f2 | cut -d ")" -f1)                
for datapport in $datapports; do echo -e "Data Pooler Port: $datapport"; done                                                       
#Data Pooler Port: 40011
#Data Pooler Port: 40012
echo "------------------------------------------------------------Datanode Slave------------------------------------------------------------------------------"
datasls=$(cat /home/serveradm/pgxc_ctl/pgxc_ctl.conf | grep datanodeSlaveServers | cut -d "(" -f2 | cut -d ")" -f1)
for datasl in $datasls; do echo -e "Data_Slave: $datasl"; done                                                               
#Data_Slave: 10.138.32.26
#Data_Slave: 10.138.32.79
dataslports=$(cat /home/serveradm/pgxc_ctl/pgxc_ctl.conf | grep datanodeSlavePorts | cut -d "(" -f2 | cut -d ")" -f1)                   
for dataslport in $dataslports; do echo -e "Data Slave Port: $dataslport"; done                                      
#Data Slave Port: 40101
#Data Slave Port: 40102
dataslpports=$(cat /home/serveradm/pgxc_ctl/pgxc_ctl.conf | grep datanodeSlavePoolerPorts | cut -d "(" -f2 | cut -d ")" -f1)            
for dataslpport in $dataslpports; do echo -e "Data Slave Pooler Port: $dataslpport"; done                                               
#Data Slave Pooler Port: 40111
#Data Slave Pooler Port: 40112
echo "--------------------------------------------------------------------------------------------------------------------------------------------------------"
