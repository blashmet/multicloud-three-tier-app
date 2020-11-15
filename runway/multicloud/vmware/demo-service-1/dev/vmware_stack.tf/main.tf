#VARIABLES
#SHARED RESOURCES
variable "vspherfe_datacenter_name" { }
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

#PROVIDERS
provider "vsphere" {
  user           = "blashmet"
  password       = ""
  vsphere_server = "siovcsa01.vcorelab.com"

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

provider "nsxt" {
  host                     = "192.168.225.107"
  username                 = "admin"
  password                 = ""
  allow_unverified_ssl     = true
  max_retries              = 10
  retry_min_delay          = 500
  retry_max_delay          = 5000
  retry_on_status_codes    = [429]
}


provider "infoblox" {
    username = "admin"
    password = ""
    #server = "10.1.1.18"
    host  = "https://gridpri.vcorelab.com/"
    sslverify = "false"
    usecookies = "false"
}



#BACKEND
terraform {
  backend "s3" {
    key = "vmware-stack.tfstate"
  }
}

#MODULE CALLS
module "vmware_stack" {

  source = "../../../modules/vmware/vmware_stack.tf"

  #VSPHERE
  vsphere_datacenter_name = var.vsphere_datacenter_name
  vsphere_datastore_name = var.vsphere_datastore_name
  vsphere_resource_pool_name = var.vsphere_resource_pool_name
  

  #APP SERVER VM
  app_server_name = var.app_server_name
  app_server_cpu_count = var.app_server_cpu_count
  app_server_memory = var.app_server_memory
  app_server_disk_space = var.app_server_disk_space
  app_network_name = var.app_network_name
  

  #DB SERVER VM
  db_server_name = var.db_server_name
  db_server_cpu_count = var.db_server_cpu_count
  db_server_memory = var.db_server_memory
  db_server_disk_space = var.db_server_disk_space
  db_network_name = var.db_network_name
  

  #NSX-T
  lb_network_name = var.lb_network_name

}