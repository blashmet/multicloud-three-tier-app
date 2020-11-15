resource "azurerm_resource_group" "demo_resource_group" {

 name     = var.resource_group_name
 location = var.location

}

resource "azurerm_virtual_network" "azure_demo_vnet" {

 name                = var.vnet_name
 address_space       = [var.vnet_address_space]
 location            = azurerm_resource_group.demo_resource_group.location
 resource_group_name = azurerm_resource_group.demo_resource_group.name

}

resource "azurerm_subnet" "subnet" {

 name                 = "acctsub"
 resource_group_name  = azurerm_resource_group.demo_resource_group.name
 virtual_network_name = azurerm_virtual_network.azure_demo_vnet.name
 address_prefix       = var.subnet_cidr

}

resource "azurerm_public_ip" "public_ip" {

 name                         = "publicIPForLB"
 location                     = azurerm_resource_group.demo_resource_group.location
 resource_group_name          = azurerm_resource_group.demo_resource_group.name
 allocation_method            = "Static"

}

resource "azurerm_lb" "lb" {

 name                = "loadBalancer"
 location            = azurerm_resource_group.demo_resource_group.location
 resource_group_name = azurerm_resource_group.demo_resource_group.name

 frontend_ip_configuration {
   name                 = "publicIPAddress"
   public_ip_address_id = azurerm_public_ip.public_ip.id
 }

}

resource "azurerm_lb_backend_address_pool" "lb_backend_address_pool" {

 resource_group_name = azurerm_resource_group.demo_resource_group.name
 loadbalancer_id     = azurerm_lb.lb.id
 name                = "BackEndAddressPool"

}

resource "azurerm_network_interface" "nic" {

 count               = 2
 name                = "nic${count.index}"
 location            = azurerm_resource_group.demo_resource_group.location
 resource_group_name = azurerm_resource_group.demo_resource_group.name

 ip_configuration {

   name                          = "nic_config"
   subnet_id                     = azurerm_subnet.subnet.id
   private_ip_address_allocation = "dynamic"

 }

}

resource "azurerm_managed_disk" "managed_disk" {
 count                = 2
 name                 = "datadisk_existing_${count.index}"
 location             = azurerm_resource_group.demo_resource_group.location
 resource_group_name  = azurerm_resource_group.demo_resource_group.name
 storage_account_type = "Standard_LRS"
 create_option        = "Empty"
 disk_size_gb         = "1023"
}

resource "azurerm_availability_set" "avset" {
 name                         = "avset"
 location                     = azurerm_resource_group.demo_resource_group.location
 resource_group_name          = azurerm_resource_group.demo_resource_group.name
 platform_fault_domain_count  = 2
 platform_update_domain_count = 2
 managed                      = true
}

resource "azurerm_virtual_machine" "test" {
 count                 = 2
 name                  = "acctvm${count.index}"
 location              = azurerm_resource_group.demo_resource_group.location
 availability_set_id   = azurerm_availability_set.avset.id
 resource_group_name   = azurerm_resource_group.demo_resource_group.name
 network_interface_ids = [element(azurerm_network_interface.nic.*.id, count.index)]
 vm_size               = "Standard_DS1_v2"
 delete_os_disk_on_termination = true
 delete_data_disks_on_termination = true

 storage_image_reference {

   publisher = "Canonical"
   offer     = "UbuntuServer"
   sku       = "16.04-LTS"
   version   = "latest"

 }

 storage_os_disk {

   name              = "myosdisk${count.index}"
   caching           = "ReadWrite"
   create_option     = "FromImage"
   managed_disk_type = "Standard_LRS"

 }

 # Optional data disks
 storage_data_disk {

   name              = "datadisk_new_${count.index}"
   managed_disk_type = "Standard_LRS"
   create_option     = "Empty"
   lun               = 0
   disk_size_gb      = "1023"
   
 }

 storage_data_disk {

   name            = element(azurerm_managed_disk.managed_disk.*.name, count.index)
   managed_disk_id = element(azurerm_managed_disk.managed_disk.*.id, count.index)
   create_option   = "Attach"
   lun             = 1
   disk_size_gb    = element(azurerm_managed_disk.managed_disk.*.disk_size_gb, count.index)

 }

 os_profile {

   computer_name  = "terraform-demo-vm"
   admin_username = "terraform-admin"
   admin_password = ""

 }

 os_profile_linux_config {

   disable_password_authentication = false

 }

 tags = {

   environment = var.environment

 }

}