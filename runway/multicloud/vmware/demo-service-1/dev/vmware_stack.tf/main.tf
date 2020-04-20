#VARIABLES
#SHARED RESOURCES
variable "vsphere_datacenter_name" { }
variable "vsphere_datastore_name" { }
variable "vsphere_resource_pool_name" { }
variable "vsphere_network_name" { }

#APP SERVER VM
variable "app_server_name" { }
variable "app_server_cpu_count" { }
variable "app_server_memory" { }
variable "app_server_guest_id" { }
variable "app_server_disk_space" { }

#DB SERVER VM
variable "db_server_name" { }
variable "db_server_cpu_count" { }
variable "db_server_memory" { }
variable "db_server_guest_id" { }
variable "db_server_disk_space" { }



#PROVIDERS
provider "vsphere" {
  user           = "blashmet"
  password       = "vcorelabR0cks"
  vsphere_server = "siovcsa01.vcorelab.com"

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

provider "nsxt" {
  host                     = "siovcsa01.vcorelab.com"
  username                 = "admin"
  password                 = "default"
  allow_unverified_ssl     = true
  max_retries              = 10
  retry_min_delay          = 500
  retry_max_delay          = 5000
  retry_on_status_codes    = [429]
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

  #SHARED RESOURCES
  vsphere_datacenter_name = var.vsphere_datacenter_name
  vsphere_datastore_name = var.vsphere_datastore_name
  vsphere_resource_pool_name = var.resource_pool
  vsphere_network_name = var.network_name

  #APP SERVER VM
  app_server_name = var.app_server_name
  app_server_cpu_count = var.app_server_cpu_count
  app_server_memory = var.app_server_memory
  app_server_guest_id = var.app_server_guest_id
  app_server_disk_space = var.app_server_disk_space

  #DB SERVER VM
  db_server_name = var.db_server_name
  db_server_cpu_count = var.db_server_cpu_count
  db_server_memory = var.db_server_memory
  db_server_guest_id = var.db_server_guest_id
  db_server_disk_space = var.db_server_disk_space

}