# Example from Ansible Playbooks
- name: Presto Install
  hosts: prestomaster
  become: cassandra
  # remote_user: cassandra
  tasks:
      - name: Copy the script to destination
        copy: src=/home/cassandra/ansible/scripts/install_cassandra.sh dest=/home/cassandra/
      - name: Run the script
        command: sh /home/cassandra/install_presto.sh /app true 172.31.47.10,172.31.47.11,172.31.47.12,172.31.47.13,172.31.47.14,172.31.47.15,172.31.47.16,172.31.47.17,172.31.47.18 172.31.247.10 8080