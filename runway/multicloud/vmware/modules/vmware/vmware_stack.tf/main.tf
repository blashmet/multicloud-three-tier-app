#INFOBLOX NETWORKS

resource "infoblox_ip" "app_ls_cidr" {

  cidr = "10.2.20.0/24"

}

resource "infoblox_ip" "db_ls_cidr" {

  cidr = "10.2.21.0/24"

}

resource "infoblox_ip" "web_ls_cidr" {

  cidr = "10.2.22.0/24"

}

#VSPHERE DATA SOURCES

data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter_name
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphere_datastore_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name          = var.vsphere_resource_pool_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "app_network" {
  name          = var.app_network_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "db_network" {
  name          = var.db_network_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "lb_network" {
  name          = var.lb_network_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = "2012r2-vra76-gugent"
  datacenter_id = data.vsphere_datacenter.dc.id
}

#VSPHERE RESOURCES

##VIRTUAL MACHINES
resource "vsphere_virtual_machine" "app_server_vm" {

  name                        = var.app_server_name
  resource_pool_id            = data.vsphere_resource_pool.pool.id
  datastore_id                = data.vsphere_datastore.datastore.id
  guest_id                    = data.vsphere_virtual_machine.template.guest_id
  scsi_type                   = data.vsphere_virtual_machine.template.scsi_type
  num_cpus                    = var.app_server_cpu_count
  memory                      = var.app_server_memory
  firmware                    = "bios"
  wait_for_guest_net_timeout  = "1"

  network_interface {

    network_id = data.vsphere_network.app_network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]

  }
  

  disk {

    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned

  }
  
  clone {

    template_uuid = data.vsphere_virtual_machine.template.id

        customize {
      

            network_interface {
              ipv4_address = infoblox_ip.app_ls_cidr.ipaddress
              ipv4_netmask = 24
            }

            ipv4_gateway = "10.2.20.1"

            windows_options {
              computer_name  = "app-server"
              workgroup      = "terraform"
              admin_password = "VMw4re"
              auto_logon = true
              auto_logon_count = 1
              run_once_command_list = [
                  "powershell.exe Install-WindowsFeature -Name Web-Server, Web-Mgmt-Tools"
                  ]
            }

        }

  }

}

resource "vsphere_virtual_machine" "db_server_vm" {

  name                        = var.db_server_name
  resource_pool_id            = data.vsphere_resource_pool.pool.id
  datastore_id                = data.vsphere_datastore.datastore.id
  guest_id                    = data.vsphere_virtual_machine.template.guest_id
  scsi_type                   = data.vsphere_virtual_machine.template.scsi_type
  num_cpus                    = var.db_server_cpu_count
  memory                      = var.db_server_memory
  wait_for_guest_net_timeout  = "1"
  firmware                    = "bios"

  network_interface {

    network_id = data.vsphere_network.app_network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]

  }


  disk {

    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned

  }

  clone {

    template_uuid = data.vsphere_virtual_machine.template.id

        customize {
      

            network_interface {
              ipv4_address = infoblox_ip.db_ls_cidr.ipaddress
              ipv4_netmask = 24
            }

            ipv4_gateway = "10.2.21.1"
            

            windows_options {
              computer_name  = "db-server"
              workgroup      = "terraform"
              admin_password = "VMw4re"
              auto_logon = true
              auto_logon_count = 1
              run_once_command_list = [
                  "powershell.exe Install-WindowsFeature -Name Web-Server, Web-Mgmt-Tools"
                  ]
                }
            }

        }

  }




#NSX-T DATA SOURCES

##DEFAULT NETWORKING
data "nsxt_edge_cluster" "EC" {

  display_name = "edge-cluster-1"

}

data "nsxt_transport_zone" "transport_zone" {

  display_name = "overlay-transport-zone"

}

data "nsxt_logical_tier0_router" "default" {

  display_name = "T0-LR-1"

}

#NSX-T RESOURCES

resource "nsxt_logical_router_link_port_on_tier0" "default" {

  display_name      = "port_on_tier0_terraform"
  logical_router_id = data.nsxt_logical_tier0_router.default.id

}

resource "nsxt_logical_tier1_router" "default" {

  display_name    = "T1_LR_01_terraform"
  edge_cluster_id = data.nsxt_edge_cluster.EC.id
  enable_router_advertisement = true
  advertise_connected_routes  = true

}

resource "nsxt_logical_router_link_port_on_tier1" "default" {

  display_name                  = "port_on_tier1_terraform"
  logical_router_id             = nsxt_logical_tier1_router.default.id
  linked_logical_router_port_id = nsxt_logical_router_link_port_on_tier0.default.id

}

resource "nsxt_logical_switch" "logical_switch" {

  display_name       = "logical_switch_terraform"
  transport_zone_id  = data.nsxt_transport_zone.transport_zone.id
  admin_state        = "UP"
  description        = "Logical Switch for the T1 Router."
  replication_mode   = "MTEP"

}

resource "nsxt_logical_port" "logical_port" {

  display_name = "logical_port_terraform"
  admin_state       = "UP"
  description       = "Logical Port on the Logical Switch for the T1 Infrastructure Router."
  logical_switch_id = nsxt_logical_switch.logical_switch.id

}

resource "nsxt_logical_router_downlink_port" "downlink_port" {

  display_name = "downlink_port_terraform"
  description                   = "Downlink port connecting the t1 router to its Logical Switch"
  logical_router_id             = nsxt_logical_tier1_router.default.id
  linked_logical_switch_port_id = nsxt_logical_port.logical_port.id
  ip_address                    = "10.2.21.1/31"

}


##LOAD BALANCING

###POOL
resource "nsxt_lb_pool" "lb_pool" {

  description                  = "lb_pool provisioned by Terraform"
  display_name                 = "lb_pool"
  algorithm                    = "WEIGHTED_ROUND_ROBIN"
  min_active_members           = 1
  tcp_multiplexing_enabled     = false
  tcp_multiplexing_number      = 3

  member {

    admin_state                = "ENABLED"
    backup_member              = "false"
    display_name               = "app-server"
    ip_address                 = vsphere_virtual_machine.app_server_vm.default_ip_address
    max_concurrent_connections = "5"
    port                       = "80"
    weight                     = "1"

  }


}

###VIRTUAL SERVER

resource "nsxt_lb_http_application_profile" "http_app_profile" {

  description            = "lb_http_application_profile provisioned by Terraform"
  display_name           = "lb_http_application_profile"
  
}


resource "nsxt_lb_http_virtual_server" "lb_virtual_server" {
  description                = "lb_virtual_server provisioned by terraform"
  display_name               = "virtual_server_1"
  access_log_enabled         = true
  application_profile_id     = nsxt_lb_http_application_profile.http_app_profile.id
  enabled                    = true
  ip_address                 = infoblox_ip.web_ls_cidr.ipaddress
  port                       = "80"
  default_pool_member_port   = "80"
  max_concurrent_connections = 50
  max_new_connection_rate    = 20
  pool_id                    = nsxt_lb_pool.lb_pool.id

}

###LOAD BALANCER SERVICE

resource "nsxt_lb_service" "lb_service" {

  description        = "lb_service provisioned by Terraform"
  virtual_server_ids = [nsxt_lb_http_virtual_server.lb_virtual_server.id]
  display_name       = "lb_service"
  enabled            = true
  logical_router_id  = nsxt_logical_tier1_router.default.id
  error_log_level    = "INFO"
  size               = "SMALL"
  depends_on         = [nsxt_logical_router_link_port_on_tier1.default]

}