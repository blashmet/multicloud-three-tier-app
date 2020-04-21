#SHARED RESOURCES
vsphere_datacenter_name = "Datacenter"
vsphere_datastore_name = "vsanDatastore"
vsphere_resource_pool_name = "Cluster/Resources"


#APP SERVER VM
app_server_name = "terraform_app_server"
app_server_cpu_count = "2"
app_server_memory = "2048"
app_server_disk_space = "40"
app_network_name = "App-LS"


#DB SERVER VM
db_server_name = "terraform_db_server"
db_server_cpu_count = "2"
db_server_memory = "2048"
db_server_disk_space = "40"
db_network_name = "DB-LS"


#NSX-T
lb_network_name = "Web-LS"