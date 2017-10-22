#--------------------------------------------------------------------------------------------
#INSTRUCTIONS
#Before running the script copy the ansible.tar.gz to /
#--------------------------------------------------------------------------------------------

	echo "Creating the directory in /opt with name ansible"
		mkdir /opt/ansible

	echo "Moving the tax to the /opt/ansible/"
		mv /ansible.tar.gz /opt/ansible/

	echo "Untar the ansible"
		tar -zxvf /opt/ansible/ansible.tar.gz

	echo "Moving the ansiblermp to /opt/ansible/"
		mv /ansiblerpm/ /opt/ansible/

	echo "Installing the epel-release-6-8"
		#wget https://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
		rpm -ivh /opt/ansible/ansiblerpm/epel-release-6-8.noarch.rpm

	echo "Installing the Dependencies for ansible"
		rpm -ivh /opt/ansible/ansiblerpm/libyaml-0.1.3-4.el6_6.x86_64.rpm
		rpm -ivh /opt/ansible/ansiblerpm/python-babel-0.9.4-5.1.el6.noarch.rpm
		rpm -ivh /opt/ansible/ansiblerpm/python-crypto-2.0.1-22.el6.x86_64.rpm
		rpm -ivh /opt/ansible/ansiblerpm/python-crypto2.6-2.6.1-2.el6.x86_64.rpm
		rpm -ivh /opt/ansible/ansiblerpm/python-httplib2-0.7.7-1.el6.noarch.rpm
		rpm -ivh /opt/ansible/ansiblerpm/python-markupsafe-0.9.2-4.el6.x86_64.rpm
		rpm -ivh /opt/ansible/ansiblerpm/python-paramiko-1.7.5-2.1.el6.noarch.rpm
		rpm -ivh /opt/ansible/ansiblerpm/python-pyasn1-0.0.12a-1.el6.noarch.rpm
		rpm -ivh /opt/ansible/ansiblerpm/python-simplejson-2.0.9-3.1.el6.x86_64.rpm
		rpm -ivh /opt/ansible/ansiblerpm/python-six-1.9.0-2.el6.noarch.rpm
		rpm -ivh /opt/ansible/ansiblerpm/PyYAML-3.10-3.1.el6.x86_64.rpm
		rpm -ivh /opt/ansible/ansiblerpm/python-jinja2-26-2.6-3.el6.noarch.rpm
		rpm -ivh /opt/ansible/ansiblerpm/python-keyczar-0.71c-1.el6.noarch.rpm

	echo "Installing the ansible"
		rpm -ivh /opt/ansible/ansiblerpm/ansible-2.3.1.0-1.el6.noarch.rpm

	ansible --version

		if [ $? -eq 0 ]; then
				echo "Ansible Installion Sucessfully"
			else
				echo "Ansible Installion Sucessfully"
			fi