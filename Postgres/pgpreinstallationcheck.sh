#Node Details
	#Coord1-10.138.32.75
	#Coord2-10.138.32.77
	#gtm_proxy1-10.138.32.75
	#gtm_proxy2-10.138.32.77
	#DN1-10.138.32.80
	#DN2-10.138.32.81
	#DNSL1-10.138.32.26
	#DNSL2-10.138.32.79

#PostgresXL Installation

	#Pre Installation Check

#1.ssh to all machine from gtm it should not ask for password
echo $(ssh serveradm@10.138.32.75 "hostname; /usr/sbin/ip r | grep /24 |awk '{print \$9}'")
echo $(ssh serveradm@10.138.32.77 "hostname; /usr/sbin/ip r | grep /24 |awk '{print \$9}'")
echo $(ssh serveradm@10.138.32.80 "hostname; /usr/sbin/ip r | grep /24 |awk '{print \$9}'")
echo $(ssh serveradm@10.138.32.81 "hostname; /usr/sbin/ip r | grep /24 |awk '{print \$9}'")
echo $(ssh serveradm@10.138.32.26 "hostname; /usr/sbin/ip r | grep /24 |awk '{print \$9}'")
echo $(ssh serveradm@10.138.32.79 "hostname; /usr/sbin/ip r | grep /24 |awk '{print \$9}'")
echo "*************************************************************************************************************************************"

#2. Check the IPTABLES, firewall, SELinux: all should be disable or configured properly
echo "Checking Coord1 and gtm_proxy1"
echo $(ssh serveradm@10.138.32.75 "echo "IPTABLES:";/bin/systemctl status  IPTABLES.service | grep Active | sed 's/Active://';echo "FIREWALL:";/bin/systemctl status firewalld | grep Active | sed 's/Active://';echo "SELINUX:";/usr/sbin/getenforce")
echo "-------------------------------------------------------------------------------------------------------------------------------------"
echo "Checking Coord2 and gtm_proxy2"
echo $(ssh serveradm@10.138.32.77 "echo "IPTABLES:";/bin/systemctl status  IPTABLES.service | grep Active | sed 's/Active://';echo "FIREWALL:";/bin/systemctl status firewalld | grep Active | sed 's/Active://';echo "SELINUX:";/usr/sbin/getenforce")
echo "-------------------------------------------------------------------------------------------------------------------------------------"
echo "Checking DN1"
echo $(ssh serveradm@10.138.32.80 "echo "IPTABLES:";/bin/systemctl status  iptables.service | grep Active | sed 's/Active://';echo "FIREWALL:";/bin/systemctl status firewalld | grep Active | sed 's/Active://';echo "SELINUX:"; /usr/sbin/getenforce")
echo "-------------------------------------------------------------------------------------------------------------------------------------"
echo "Checking DN2"
echo $(ssh serveradm@10.138.32.81 "echo "IPTABLES:";/bin/systemctl status  iptables.service | grep Active | sed 's/Active://';echo "FIREWALL:";/bin/systemctl status firewalld | grep Active | sed 's/Active://';echo "SELINUX:"; /usr/sbin/getenforce")
echo "-------------------------------------------------------------------------------------------------------------------------------------"
echo "Checking DNSL1"
echo $(ssh serveradm@10.138.32.26 "echo "IPTABLES:";/bin/systemctl status  iptables.service | grep Active | sed 's/Active://';echo "FIREWALL:";/bin/systemctl status firewalld | grep Active | sed 's/Active://';echo "SELINUX:"; /usr/sbin/getenforce")
echo "-------------------------------------------------------------------------------------------------------------------------------------"
echo "Checking DNSL2"
echo $(ssh serveradm@10.138.32.79 "echo "IPTABLES:";/bin/systemctl status  iptables.service | grep Active | sed 's/Active://';echo "FIREWALL:";/bin/systemctl status firewalld | grep Active | sed 's/Active://';echo "SELINUX:"; /usr/sbin/getenforce")
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
