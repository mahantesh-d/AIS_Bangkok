#transfer the files from local to cloud instance
#-----------------------------------------------
gcloud compute scp --zone <zone_name> <src> <user_name>@<instance_name>:/<destination_directory>
gcloud compute scp --zone us-east1-b D01_20171127_2d14d80_HTTP2 mahantesh_dhale@ais-test-instance:/tmp
