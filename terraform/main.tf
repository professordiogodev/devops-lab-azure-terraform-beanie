# TODO 1: terraform { required_version, required_providers { azurerm from hashicorp/azurerm, version ~> 4.0 } }
#         provider "azurerm" { features {} subscription_id = var.subscription_id }
#
# TODO 2: the resource group `rg-beanie-tf` in var.location, tags {lab = "azure-terraform-beanie"}
#
# TODO 3: the network, all inside that group and all tagged lab = "azure-terraform-beanie" where tags are supported:
#   - azurerm_virtual_network 10.30.0.0/16 and a subnet 10.30.1.0/24
#   - azurerm_network_security_group with TWO inbound Allow rules:
#       SSH (22) from var.my_ip_cidr only, priority 100;   8000 from "Internet", priority 110
#   - azurerm_subnet_network_security_group_association (an NSG attached to nothing protects nothing)
#   - azurerm_public_ip, sku Standard, allocation Static
#   - azurerm_network_interface in the subnet with that public IP
#
# TODO 4: azurerm_linux_virtual_machine named vm-beanie
#   - size var.vm_size, admin user azureuser, password authentication DISABLED, admin_ssh_key from file(var.public_key_path)
#   - Ubuntu 24.04 LTS: publisher Canonical, offer ubuntu-24_04-lts, sku server, version latest
#   - custom_data = base64encode(file("${path.module}/../cloud-init.yaml"))
#   - os_disk: Standard_LRS, ReadWrite caching
#
# TODO 5: outputs `public_ip` and `beanie_url` (http://<ip>:8000)
