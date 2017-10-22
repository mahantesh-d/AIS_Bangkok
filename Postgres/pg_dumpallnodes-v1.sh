#Function to find the filesize
function output_file_size {
  size=`stat $1 --printf="%s"`
  kb_size=`echo "scale=2; $size / 1024.0" | bc`
  echo "Finished backup for $2 - size is $kb_size KB" >> /tmp/db_backup_info.log
}

#Create the two files for log in tmp 
echo "" > /tmp/db_backup.log
echo "" > /tmp/db_backup_info.log

#Create the backup directory with current date
date_str=$(date +"%Y%m%d_%H%M%S")
backup_dir=/opt/damocles/pg_backup.$date_str

mkdir $backup_dir
pushd $backup_dir > /dev/null

#list the database
dbs=`psql -p 30002 -U serveradm -lt | grep -v : | cut -d \| -f 1 | grep -v template | grep -v -e '^\s*$' | sed -e 's/  *$//'|  tr '\n' ' '`

echo "Will backup: $dbs to $backup_dir" >> /tmp/db_backup_info.log

for db in $dbs; do
  echo "Starting backup for $db" >> /tmp/db_backup_info.log
  #create the filename for each db
  filename=$db.$date_str.sql.gz
  #Creating the binary of the dump
  filename_binary=$db.$date_str.bak.gz
  #Running the vacuum before taking the dump
  vacuumdb -p 30002 -U serveradm -z -d $db >> /tmp/db_backup.log
  #Take the dump for each db
  pg_dump -p 30002 -U serveradm -v $db -F p 2>> /tmp/db_backup.log | gzip > $filename
  pg_dump -p 30002 -U serveradm -v $db -F c 2>> /tmp/db_backup.log | gzip > $filename_binary
  output_file_size $filename "$db sql"
  output_file_size $filename_binary "$db bin"
done

#Taking the backup global objects
echo "Backing up global objects" >> /tmp/db_backup_info.log
#create the filename for global object
filename=global.$date_str.sql.gz
#pg_dumpall to take the backup of cluster
pg_dumpall --dump-nodes -p 30002 -U serveradm -v -g 2>> /tmp/db_backup.log | gzip > $filename
output_file_size $filename global

#Result will be sent to the mail
echo "Ok!" >> /tmp/db_backup_info.log
mail -s "Backup results" mahantesh.dhale@unotechsoft.com  < /tmp/db_backup_info.log
popd > /dev/null