#INFOBLOX NETWORKS

resource "infoblox_ip" "ls_app_cidr" {

  cidr = "10.23.1.0/24"

}

resource "infoblox_ip" "ls_db_cidr" {

  cidr = "10.23.2.0/24"

}

resource "infoblox_ip" "ls_web_cidr" {

  cidr = "10.23.3.0/24"

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

  depends_on = [

    nsxt_logical_switch.ls_app_terraform,

  ]

}

data "vsphere_network" "db_network" {

  name          = var.db_network_name

  datacenter_id = data.vsphere_datacenter.dc.id

  depends_on = [

    nsxt_logical_switch.ls_db_terraform,

  ]

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
  wait_for_guest_net_timeout  = "-1"

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

              ipv4_address = infoblox_ip.ls_app_cidr.ipaddress

              ipv4_netmask = 24

            }

            ipv4_gateway = "10.23.1.1"

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
  wait_for_guest_net_timeout  = "-1"
  firmware                    = "bios"

  network_interface {

    network_id = data.vsphere_network.db_network.id
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
              ipv4_address = infoblox_ip.ls_db_cidr.ipaddress
              ipv4_netmask = 24
            }

            ipv4_gateway = "10.23.2.1"
            

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

data "nsxt_logical_tier0_router" "t0_router" {

  display_name = "T0-LR-1"

}

data "nsxt_transport_zone" "overlay_transport_zone" {
  display_name = "overlay-transport-zone"
}


#NSX-T RESOURCES
resource "nsxt_logical_router_link_port_on_tier0" "tier0_link_port" {

  display_name      = "port_on_tier0_terraform"
  logical_router_id = data.nsxt_logical_tier0_router.t0_router.id

}

resource "nsxt_logical_tier1_router" "tier1_router" {

  display_name    = "tier1_router_terraform"
  edge_cluster_id = data.nsxt_edge_cluster.EC.id
  enable_router_advertisement = true
  advertise_connected_routes  = true
  advertise_static_routes     = true
  advertise_nat_routes        = true
  advertise_lb_vip_routes     = true
  advertise_lb_snat_ip_routes = true

}

resource "nsxt_logical_router_link_port_on_tier1" "tier1_link_port" {

  display_name                  = "linked_port_t0_terraform"
  logical_router_id             = nsxt_logical_tier1_router.tier1_router.id
  linked_logical_router_port_id = nsxt_logical_router_link_port_on_tier0.tier0_link_port.id

}

#3 new logical switches



resource "nsxt_logical_switch" "ls_app_terraform" {

  admin_state       = "UP"
  description       = "ls_app provisioned by Terraform"
  display_name      = "ls_app_terraform"
  transport_zone_id = data.nsxt_transport_zone.overlay_transport_zone.id
  replication_mode  = "MTEP"

}

resource "nsxt_logical_switch" "ls_db_terraform" {

  admin_state       = "UP"
  description       = "ls_db provisioned by Terraform"
  display_name      = "ls_db_terraform"
  transport_zone_id = data.nsxt_transport_zone.overlay_transport_zone.id
  replication_mode  = "MTEP"

}

resource "nsxt_logical_switch" "ls_web_terraform" {

  admin_state       = "UP"
  description       = "ls_web provisioned by Terraform"
  display_name      = "ls_web_terraform"
  transport_zone_id = data.nsxt_transport_zone.overlay_transport_zone.id
  replication_mode  = "MTEP"

}

#3 new ports on each logical switch

resource "nsxt_logical_port" "logical_port_app_switch" {
  admin_state       = "UP"
  description       = "lp_app provisioned by Terraform"
  display_name      = "lp_app_terraform"
  logical_switch_id = nsxt_logical_switch.ls_app_terraform.id
}

resource "nsxt_logical_port" "logical_port_db_switch" {
  admin_state       = "UP"
  description       = "lp_db provisioned by Terraform"
  display_name      = "lp_db_terraform"
  logical_switch_id = nsxt_logical_switch.ls_db_terraform.id
}

resource "nsxt_logical_port" "logical_port_web_switch" {
  admin_state       = "UP"
  description       = "lp_web provisioned by Terraform"
  display_name      = "lp_web_terraform"
  logical_switch_id = nsxt_logical_switch.ls_web_terraform.id
}

#3 new downlink ports on the T1 router
resource "nsxt_logical_router_downlink_port" "downlink_port_app" {

  description                   = "Downlink port provisioned by Terraform"
  display_name                  = "downlink_port_app_terraform"
  logical_router_id             = nsxt_logical_tier1_router.tier1_router.id
  linked_logical_switch_port_id = nsxt_logical_port.logical_port_app_switch.id
  ip_address                    = "10.23.1.1/24"

}

resource "nsxt_logical_router_downlink_port" "downlink_port_db" {

  description                   = "Downlink port provisioned by Terraform"
  display_name                  = "downlink_port_db_terraform"
  logical_router_id             = nsxt_logical_tier1_router.tier1_router.id
  linked_logical_switch_port_id = nsxt_logical_port.logical_port_db_switch.id
  ip_address                    = "10.23.2.1/24"

}

resource "nsxt_logical_router_downlink_port" "downlink_port_web" {
  description                   = "Downlink port provisioned by Terraform"
  display_name                  = "downlink_port_app_terraform"
  logical_router_id             = nsxt_logical_tier1_router.tier1_router.id
  linked_logical_switch_port_id = nsxt_logical_port.logical_port_web_switch.id
  ip_address                    = "10.23.3.1/24"

}


##LOAD BALANCING

###POOL
resource "nsxt_lb_pool" "lb_pool" {

  description                  = "lb_pool provisioned by Terraform"
  display_name                 = "lb_pool_terraform"
  algorithm                    = "ROUND_ROBIN"
  min_active_members           = 1
  tcp_multiplexing_enabled     = false
  tcp_multiplexing_number      = 3

  snat_translation {

    type          = "SNAT_AUTO_MAP"

  }

  member {

    admin_state                = "ENABLED"
    backup_member              = "false"
    display_name               = "app-server-terraform"
    ip_address                 = vsphere_virtual_machine.app_server_vm.default_ip_address
    max_concurrent_connections = "5"
    port                       = "80"

  }


}

###VIRTUAL SERVER

resource "nsxt_lb_http_application_profile" "http_app_profile" {

  description            = "lb_http_application_profile provisioned by Terraform"
  display_name           = "lb_http_application_profile_terraform"
  
}


resource "nsxt_lb_http_virtual_server" "lb_virtual_server" {
  description                = "lb_virtual_server provisioned by terraform"
  display_name               = "virtual_server_1_terraform"
  access_log_enabled         = true
  application_profile_id     = nsxt_lb_http_application_profile.http_app_profile.id
  enabled                    = true
  ip_address                 = infoblox_ip.ls_web_cidr.ipaddress
  port                       = "80"
  default_pool_member_port   = "80"
  pool_id                    = nsxt_lb_pool.lb_pool.id

}

###LOAD BALANCER SERVICE

resource "nsxt_lb_service" "lb_service" {

  description        = "lb_service provisioned by Terraform"
  virtual_server_ids = [nsxt_lb_http_virtual_server.lb_virtual_server.id]
  display_name       = "lb_service_terraform"
  enabled            = true
  logical_router_id  = nsxt_logical_tier1_router.tier1_router.id
  error_log_level    = "INFO"
  size               = "SMALL"
  depends_on        = [nsxt_logical_router_link_port_on_tier1.tier1_link_port]

}