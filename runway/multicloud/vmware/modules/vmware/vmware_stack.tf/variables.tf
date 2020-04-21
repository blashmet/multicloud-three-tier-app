#SHARED RESOURCES
variable "vsphere_datacenter_name" { }
variable "vsphere_datastore_name" { }
variable "vsphere_resource_pool_name" { }
variable "app_network_name" { }
variable "db_network_name" { }
variable "lb_network_name" { }

#APP SERVER VM
variable "app_server_name" { }
variable "app_server_cpu_count" { }
variable "app_server_memory" { }
variable "app_server_disk_space" { }

#DB SERVER VM
variable "db_server_name" { }
variable "db_server_cpu_count" { }
variable "db_server_memory" { }
variable "db_server_disk_space" { }