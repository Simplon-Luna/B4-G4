# Non nécessaire depuis installation de Gitea :
#*# Creation Panel VM
#*# resource "azurerm_linux_virtual_machine" "myterraformvmpanel" {
#*#  name                  = "${var.prefix}_vmPanel"
#*#  location              = azurerm_resource_group.rg.location
#*#  resource_group_name   = azurerm_resource_group.rg.name
#*#  network_interface_ids = [azurerm_network_interface.myterraformnetworkinterface.id, azurerm_network_interface.myterraformnetworkinterfacePanel.id]
#*#  size                  = "Standard_DS1_v2"

#*#  os_disk {
#*#    name                 = "myOsDisk2"
#*#    caching              = "ReadWrite"
#*#    storage_account_type = "Premium_LRS"
#*#  }

#*#  source_image_reference {
#*#    publisher = "Canonical"
#*#    offer     = "UbuntuServer"
#*#    sku       = "18.04-LTS"
#*#    version   = "latest"
#*#  }

#*#  computer_name                   = "myvmPanel"
#*#  admin_username                  = "azureuser"
#*#  disable_password_authentication = false
#*#  admin_password                  = "123456Azerty$."
#*#}

#*# # Creation network interface public Panel
#*# resource "azurerm_network_interface" "myterraformnetworkinterface" {
#*#   name                = "${var.prefix}_network_interface1"
#*#   location            = azurerm_resource_group.rg.location
#*#   resource_group_name = azurerm_resource_group.rg.name

#*#   ip_configuration {
#*#     name                          = "${var.prefix}_ip_config_Panel_Pub"
#*#     subnet_id                     = azurerm_subnet.myterraformsubnetGitea.id
#*#     private_ip_address_allocation = "Dynamic"
#*#     public_ip_address_id          = azurerm_public_ip.mypublicip.id
#*#   }
#*# }

#*# # Creation network interface Private Panel
#*# resource "azurerm_network_interface" "myterraformnetworkinterfacePanel" {
#*#   name                = "${var.prefix}_network_interface_Panel_Priv"
#*#   location            = azurerm_resource_group.rg.location
#*#   resource_group_name = azurerm_resource_group.rg.name

#*#   ip_configuration {
#*#     name                          = "${var.prefix}_ip_config_Panel"
#*#     subnet_id                     = azurerm_subnet.myterraformsubnetGitea.id
#*#     private_ip_address_allocation = "Dynamic"
#*#   }
#*# }

#*# # Creation of Redis
#*# # /!\ NOTE: the Name used for Redis needs to be globally unique /!\
#*# resource "azurerm_redis_cache" "redis_azure" {
#*#   name                = "${var.prefix}redis"
#*#   location            = azurerm_resource_group.rg.location
#*#   resource_group_name = azurerm_resource_group.rg.name
#*#   capacity            = 2
#*#   family              = "C"
#*#   sku_name            = "Standard"
#*#   enable_non_ssl_port = false
#*#   minimum_tls_version = "1.2"

#*#   redis_configuration {
#*#  }
#*# }