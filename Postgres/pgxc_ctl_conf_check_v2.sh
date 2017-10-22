#PostgresXl Pgxctcl Conf configuration
echo "---------------------------------------------------------GTM Master-------------------------------------------------------------------------------------"
echo $(echo "GTM_Master";cat $1 | grep gtmMasterServer | cut -d "=" -f2 | cut -d "#" -f1)
#GTM_Master 10.138.32.25
echo $(echo "GTM Port: ";cat $1 | grep gtmMasterPort | cut -d "=" -f2 | cut -d "#" -f1)       
#GTM Port: 20000
echo "---------------------------------------------------------GTM Slave--------------------------------------------------------------------------------------"
echo $(echo "GTM_Slave";cat $1 | grep gtmSlaveServer | cut -d "=" -f2 | cut -d "#" -f1)      
#GTM_Slave 10.138.32.27
echo $(echo "GTM Slave Port: ";cat $1 | grep gtmSlavePort | cut -d "=" -f2 | cut -d "#" -f1)        
#GTM Slave Port: 20001
echo "---------------------------------------------------------GTM Proxy--------------------------------------------------------------------------------------"
inc=1
gtms=$(cat $1 | grep gtmProxyServers | cut -d "(" -f2 | cut -d ")" -f1)                           
for gtm in $gtms; do echo -e "GTM_Proxy $inc: $gtm";let "inc+=1"; done                                                                                 
#GTM_Proxy: 10.138.32.75
#GTM_Proxy: 10.138.32.77
inc=1
gtmpports=$(cat $1 | grep gtmProxyPorts | cut -d "(" -f2 | cut -d ")" -f1) 
for gtmpport in $gtmpports; do echo -e "GTM Proxy Port $inc : $gtmpport";let "inc+=1"; done                                       
#GTM Proxy Port: 20101
#GTM Proxy Port: 20102
echo "----------------------------------------------------------Coordinator-----------------------------------------------------------------------------------"
inc=1
coords=$(cat $1 | grep coordMasterServer | cut -d "(" -f2 | cut -d ")" -f1)
for coord in $coords; do echo -e "Coordinator $inc: $coord";let "inc+=1"; done                                                   
#Coordinator: 10.138.32.75
#Coordinator: 10.138.32.77
inc=1
coordports=$(cat $1 | grep coordPorts | cut -d "(" -f2 | cut -d ")" -f1)                 
for coordport in $coordports; do echo -e "Coordinator Port $inc: $coordport";let "inc+=1"; done                                                           
#Coordinator Port: 30001
#Coordinator Port: 30002
inc=1
coordpports=$(cat $1 | grep poolerPorts | cut -d "(" -f2 | cut -d ")" -f1)
for coordpport in $coordpports; do echo -e "Coordinator Pooler Port $inc: $coordpport";let "inc+=1"; done                                 
#Coordinator Pooler Port: 30011
#Coordinator Pooler Port: 30012
echo "-----------------------------------------------------------Datanode Master------------------------------------------------------------------------------"
inc=1
datas=$(cat $1 | grep datanodeMasterServers | cut -d "(" -f2 | cut -d ")" -f1)                      
for data in $datas; do echo -e "Datanode $inc: $data";let "inc+=1"; done                                                                        
#Datanode: 10.138.32.80
#Datanode: 10.138.32.81
inc=1
dataports=$(cat $1 | grep datanodePorts | cut -d "(" -f2 | cut -d ")" -f1)                    
for dataport in $dataports; do echo -e "Datanode Port $inc: $dataport";let "inc+=1"; done                                           
#Datanode Port: 40001
#Datanode Port: 40002
inc=1
datapports=$(cat $1 | grep datanodePoolerPorts | cut -d "(" -f2 | cut -d ")" -f1)                
for datapport in $datapports; do echo -e "Data Pooler Port $inc: $datapport";let "inc+=1"; done                                                       
#Data Pooler Port: 40011
#Data Pooler Port: 40012
echo "------------------------------------------------------------Datanode Slave------------------------------------------------------------------------------"
inc=1
datasls=$(cat $1 | grep datanodeSlaveServers | cut -d "(" -f2 | cut -d ")" -f1)
for datasl in $datasls; do echo -e "Data_Slave $inc: $datasl";let "inc+=1"; done                                                               
#Data_Slave: 10.138.32.26
#Data_Slave: 10.138.32.79
inc=1
dataslports=$(cat $1 | grep datanodeSlavePorts | cut -d "(" -f2 | cut -d ")" -f1)                   
for dataslport in $dataslports; do echo -e "Data Slave Port $inc: $dataslport";let "inc+=1"; done                                      
#Data Slave Port: 40101
#Data Slave Port: 40102
inc=1
dataslpports=$(cat $1 | grep datanodeSlavePoolerPorts | cut -d "(" -f2 | cut -d ")" -f1)            
for dataslpport in $dataslpports; do echo -e "Data Slave Pooler Port $inc: $dataslpport";let "inc+=1"; done                                               
#Data Slave Pooler Port: 40111
#Data Slave Pooler Port: 40112
echo "--------------------------------------------------------------------------------------------------------------------------------------------------------"