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

resource "vsphere_virtual_machine" "db_server_vm" {

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

data "nsxt_edge_cluster" "EC" {
  display_name = "%s"
}

data "nsxt_logical_tier0_router" "test" {
  display_name = "%s"
}

resource "nsxt_logical_router_link_port_on_tier0" "test" {
  display_name      = "port_on_tier0"
  logical_router_id = "${data.nsxt_logical_tier0_router.test.id}"
}

resource "nsxt_logical_tier1_router" "test" {
  display_name    = "test"
  edge_cluster_id = "${data.nsxt_edge_cluster.EC.id}"
}

resource "nsxt_logical_router_link_port_on_tier1" "test" {
  logical_router_id             = "${nsxt_logical_tier1_router.test.id}"
  linked_logical_router_port_id = "${nsxt_logical_router_link_port_on_tier0.test.id}"
}

resource "nsxt_lb_service" "lb_service" {
  description  = "lb_service provisioned by Terraform"
  display_name = "lb_service"

  tag {
    scope = "color"
    tag   = "red"
  }

  enabled           = true
  logical_router_id = "${nsxt_logical_tier1_router.test.id}"
  error_log_level   = "INFO"
  size              = "MEDIUM"

  depends_on        = ["nsxt_logical_router_link_port_on_tier1.test"]
}