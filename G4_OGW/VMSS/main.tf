# Resource group name creation
resource "random_pet" "rg_name" {
  prefix = var.resource_group_name_prefix
}

# Resource group creation
resource "azurerm_resource_group" "rg" {
  name     = random_pet.rg_name.id
  location = var.location
}

#**# # Create output for rgname for Backup Vault Unlock
#**# resource "local_file" "rg_name" {
#**#    content  = azurerm_resource_group.rg.name
#**#    filename = "rg_name.json"
#**# }

#*# resource "azurerm_ssh_public_key" "ssh_key" {
#*#   name                = "ssh_key_admin"
#*#   resource_group_name = azurerm_resource_group.rg.name
#*#   location            = azurerm_resource_group.rg.location
#*#   public_key          = file("~/.ssh/ssh.pub") 
#*# }

# Creation virtual network
resource "azurerm_virtual_network" "myterraformnetwork" {
  name                = "Tf_vnet_g4"
  address_space       = ["10.0.0.0/21"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Creation Bastion network
resource "azurerm_virtual_network" "myterraformnetworkBastion" {
  name                = "${var.prefix}bastion"
  address_space       = ["10.0.4.0/23"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Creation Bastion subnet
resource "azurerm_subnet" "SubnetAzureBastion" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.myterraformnetworkBastion.name
  address_prefixes     = ["10.0.4.0/24"]
}

# Creation Bastion Subnet 2
resource "azurerm_subnet" "SubnetAzBastet" {
  name                 = "AzureBastetSubnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.myterraformnetworkBastion.name
  address_prefixes     = ["10.0.5.0/24"]
}

# Creation subnet Gitea
resource "azurerm_subnet" "myterraformsubnetGitea" {
  name                 = "${var.prefix}_subnet_Gitea"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.myterraformnetwork.name
  address_prefixes     = ["10.0.6.0/24"]
}

# Creation public ip Bastion
resource "azurerm_public_ip" "mypublicip" {
  name                 = "${var.prefix}_public_ip_Bastion"
  resource_group_name  = azurerm_resource_group.rg.name
  location             = azurerm_resource_group.rg.location
  allocation_method    = "Static"
  sku                  = "Standard"
}

# Creation Network Security Group and Rules
resource "azurerm_network_security_group" "myterraformsecuritygroup" {
  name                = "${var.prefix}_security_group"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  
   security_rule {
    name                       = "gitea"
    priority                   = 600
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3000"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Creation network interface Gitea
resource "azurerm_network_interface" "myterraformnetworkinterfaceGitea" {
  name                = "${var.prefix}_network_interface_Gitea"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "${var.prefix}_ip_config_Gitea"
    subnet_id                     = azurerm_subnet.myterraformsubnetGitea.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Creation network interface Admin Bastion
resource "azurerm_network_interface" "myterraformnetworkinterfaceAdminB" {
  name                = "${var.prefix}_network_interface_AdminB"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "${var.prefix}_ip_config_AdminB"
    subnet_id                     = azurerm_subnet.SubnetAzBastet.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Creation network interface Admin LB
resource "azurerm_network_interface" "myterraformnetworkinterfaceAdminLB" {
  name                = "${var.prefix}_network_interface_AdminLB"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "${var.prefix}_ip_config_AdminLB"
    subnet_id                     = azurerm_subnet.SubnetAzBastet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.5.20"
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "terraformconnect" {
  network_interface_id      = azurerm_network_interface.myterraformnetworkinterfaceGitea.id
  network_security_group_id = azurerm_network_security_group.myterraformsecuritygroup.id
}

# Creation network interface LoadB
resource "azurerm_network_interface" "myterraformnetworkinterfaceLoadB" {
  name                = "${var.prefix}_network_interface_LoadB"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "${var.prefix}_ip_config4"
    subnet_id                     = azurerm_subnet.myterraformsubnetGitea.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Creation public ip Load Balancer - Front
resource "azurerm_public_ip" "mypublicip3" {
  name                 = "${var.prefix}_public_ip_LoadB_Front"
  resource_group_name  = azurerm_resource_group.rg.name
  location             = azurerm_resource_group.rg.location
  # virtual_network_name = azurerm_virtual_network.myterraformnetwork.name
  allocation_method    = "Static"
  sku                  = "Standard"
  domain_name_label    = "b4g4lb"
}

# Creation of Load Balancer
resource "azurerm_lb" "load-balance" {
  name                = "${var.prefix}_load-blance"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "${var.prefix}ip_public_LoadB"
    public_ip_address_id = azurerm_public_ip.mypublicip3.id
  }
} 

# Creation of LoadB Backend Pool Panel
resource "azurerm_lb_backend_address_pool" "backendpoolpanel" {
  resource_group_name = azurerm_resource_group.rg.name
  loadbalancer_id     = azurerm_lb.load-balance.id
  name                = "BackEndAddressPool"
}

# Creation of Backend Pool's Private IP address
resource "azurerm_lb_backend_address_pool_address" "backendpoolAdress" {
  name                    = "${var.prefix}BackendPool"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backendpoolpanel.id
  virtual_network_id      = azurerm_virtual_network.myterraformnetwork.id
  ip_address              = azurerm_network_interface.myterraformnetworkinterfaceLoadB.private_ip_address
}

# Config of LoadB Outbound rules
resource "azurerm_lb_outbound_rule" "outbound_rule_panel" {
  name                    = "${var.prefix}OutboundRule"
  resource_group_name = azurerm_resource_group.rg.name
  loadbalancer_id         = azurerm_lb.load-balance.id
  protocol                = "Tcp"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backendpoolpanel.id

  frontend_ip_configuration {
    name = azurerm_lb.load-balance.frontend_ip_configuration[0].name
  }
}

# Creation Bastion
resource "azurerm_bastion_host" "mybastion" {
  name                = "${var.prefix}_bastion"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.SubnetAzureBastion.id
    public_ip_address_id = azurerm_public_ip.mypublicip.id
  }
}

# Creation Gitea VM
resource "azurerm_linux_virtual_machine" "myterraformGitea" {
  name                  = "${var.prefix}_vmGitea"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.myterraformnetworkinterfaceGitea.id]
  size                  = "Standard_DS1_v2"

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  custom_data                     = filebase64("gitea.yml")
  computer_name                   = "myvmGitea"
  admin_username                  = "Giteauser"
  disable_password_authentication = false
  admin_password                  = "123456ytreza$."
}

# Creation VM Admin
resource "azurerm_linux_virtual_machine" "VMAdmin" {
  name                  = "${var.prefix}_vmAdmin"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.myterraformnetworkinterfaceAdminB.id, azurerm_network_interface.myterraformnetworkinterfaceAdminLB.id]
  size                  = "Standard_DS1_v2"

  os_disk {
    name                 = "myAdminOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  computer_name                   = "myAdminVM"
  admin_username                  = "G4bosses"
  disable_password_authentication = false
  admin_password                  = "123456bossesarebest$."
}

# Creation of MariaDB
resource "azurerm_mariadb_server" "mariadbterraform" {
  name                = "${var.prefix}mariadb"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  administrator_login          = "mariadbadmin"
  administrator_login_password = "H@Sh1CoR3!"

  sku_name   = "B_Gen5_2"
  storage_mb = 5120
  version    = "10.2"

  auto_grow_enabled             = true
  backup_retention_days         = 7
  geo_redundant_backup_enabled  = false
  public_network_access_enabled = true
  ssl_enforcement_enabled       = true
}

# Creation Storage Account
resource "azurerm_storage_account" "stor_acc" {
  name                     = "${var.prefix}storageacc"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Creation Storage Share
resource "azurerm_storage_share" "storshare" {
  name                 = "${var.prefix}storshare"
  storage_account_name = azurerm_storage_account.stor_acc.name
  quota                = 5
  enabled_protocol     = "SMB"
}

## Prerequisites for Azure Monitor creations
 
  # Creation Application Insight
resource "azurerm_application_insights" "app_insight" {
  name                = "${var.prefix}app_insight"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  application_type    = "web"
}

  # Creation Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  name                = "analyticsworkspace"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "PerGB2018"
#  retention_in_days   = "${var.retention_period}"
}

  # Creation Monitor Action Group
resource "azurerm_monitor_action_group" "moni_action_gp" {
  name                = "${var.prefix}monitor_action_gp"
  resource_group_name = azurerm_resource_group.rg.name
  short_name          = "action_gp"
 
#  webhook_receiver {
#    name        = "${var.webhook_name}"
#    service_uri = "${var.webhook_url}"
#  }
}

## Monitoring Alerts
  # Creation Action Group
resource "azurerm_monitor_action_group" "email_alert" {
  name                = "${var.prefix}email-alert"
  resource_group_name = azurerm_resource_group.rg.name
  short_name          = "email-alert"

   email_receiver {
    name                    = "sendtoAdmin"
    email_address           = "${var.adminmail}"
    use_common_alert_schema = true
  }

}

## Metrics definition
resource "azurerm_monitor_metric_alert" "percentage_CPU" {
  name                = "${var.prefix}CPU-Threshold-alert"
  resource_group_name = azurerm_resource_group.rg.name
  scopes              = [azurerm_linux_virtual_machine.myterraformGitea.id]
  description         = "The alert will be sent if the CPU usage exceeds 90%"

  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name      = "Percentage CPU"
    aggregation      = "Count"
    operator         = "GreaterThan"
    threshold        = 90    
  }

  action {
    action_group_id = azurerm_monitor_action_group.email_alert.id
  }

  depends_on = [
    azurerm_linux_virtual_machine.myterraformGitea,
    azurerm_monitor_metric_alert.percentage_CPU
  ]
}

resource "azurerm_monitor_metric_alert" "mariadb" {
  name                = "${var.prefix}alert_name_db"
  resource_group_name = azurerm_resource_group.rg.name
  scopes              = [azurerm_mariadb_server.mariadbterraform.id]
  description         = "Espace disponible sur la base de données < 10%"

  criteria {
    metric_namespace = "Microsoft.DBforMariaDB/servers"
    metric_name      = "storage_percent"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 90
  }

  action {
    action_group_id = azurerm_monitor_action_group.email_alert.id
  }
}

# Creation Azure Vault
resource "azurerm_recovery_services_vault" "myvault" {
  name                = "${var.prefix}vault"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard"
}

# Creation Azure Backup Vault
resource "azurerm_backup_policy_vm" "vault_policy" {
  name                = "${var.prefix}vaultpolicy"
  resource_group_name = azurerm_resource_group.rg.name
  recovery_vault_name = azurerm_recovery_services_vault.myvault.name

  timezone = "UTC"

# Run Bash command Terraform / Deactivate "delete-feature-state"
    provisioner "local-exec" {
      command = "az backup vault backup-properties set --soft-delete-feature-state Disable --resource-group ${azurerm_resource_group.rg.name} --name ${azurerm_recovery_services_vault.myvault.name} --ids ${azurerm_recovery_services_vault.myvault.id}"
    }

  backup {
    frequency = "Daily"
    time      = "23:00"
  }

  retention_daily {
    count = 7
  }

  retention_weekly {
    count    = 1
    weekdays = ["Sunday"]
  }

  retention_monthly {
    count    = 4
    weekdays = ["Sunday", "Wednesday"]
    weeks    = ["First", "Last"]
  }

  retention_yearly {
    count    = 1
    weekdays = ["Sunday"]
    weeks    = ["Last"]
    months   = ["January"]
  }
}

# Creation Load test
resource "azurerm_load_test" "Load_test" {
  name                = "${var.prefix}_Load_test"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

    timeouts {
      create = "30m"
      read = "5m"
    }
}