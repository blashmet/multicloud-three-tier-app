#DATA SOURCES

data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter_name
}

data "vsphere_datastore" "datastore" {
  name          = var.datastore_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name          = var.resource_pool_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.network_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

#RESOURCES
resource "vsphere_virtual_machine" "app_server_vm" {

  name             = var.app_server_name
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = var.app_server_cpu_count
  memory   = var.app_server_memory
  guest_id = var.app_server_guest_id

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label = "disk0"
    size  = var.app_server_disk_space
  }
}

resource "vsphere_virtual_machine" "app_server_vm" {

  name             = var.db_server_name
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = var.db_server_cpu_count
  memory   = var.db_server_memory
  guest_id = var.db_server_guest_id

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label = "disk1"
    size  = var.db_server_disk_space
  }
}

#NSX-T RESOURCES
