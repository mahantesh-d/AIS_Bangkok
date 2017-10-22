echo "Selecting the set field and converting into list type"
#cqlsh -p cassandra -u cassandra -k dummy 10.138.32.76 -e "SELECT address, id from test" | grep -Pv "id|---|\(" | sed 's/{/[/g' | sed 's/}/]/g' | sed '/1034/d' | sed '/^$/d' | sed 's/^/UPDATE TEST SET addreslist = /g' | sed 's/|/WHERE id = /g' | sed 's/$/;/g' > /tmp/updatetest

#Selecting the set field with primary key and making the update query and writing in updatetest file
#------------------------------------------------------------------------------------------------------------

cqlsh -p cassandra -u cassandra -k dummy 10.138.32.76  -f /tmp/select | grep -Pv "id|---|\(" | sed 's/{/[/g' | sed 's/}/]/g' | sed '/1034/d' | sed '/^$/d' | sed 's/^/UPDATE TEST SET addreslist = /g' | sed 's/|/WHERE id = /g' | sed 's/$/;/g' > /tmp/updatetest

#Running the script from command line using cqlsh 
#-----------------------------------------------------

echo "Updating the table"
cqlsh -p cassandra -u cassandra -k dummy 10.138.32.76 -f /tmp/updatetests