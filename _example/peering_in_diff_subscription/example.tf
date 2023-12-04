provider "azurerm" {
  features {}
  subscription_id = "c468b1axxxxxxxxxxxxxxxxxxded9dw"
}

module "resource_group" {
  source      = "git::git@github.com:opsstation/terraform-azure-resource-group.git"
  name        = "app"
  environment = "test"
  location    = "North Europe"
}


#Vnet
module "vnet" {
  source              = "git::git@github.com:opsstation/terraform-azure-vnet.git"
  name                = "app"
  environment         = "test"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  address_space       = "172.0.0.0/16"
}


provider "azurerm" {
  alias = "mgmt"
  features {}
  subscription_id = "0a7be84xxxxxxxxxxxxxxxxxx5e"
}

data "azurerm_resource_group" "resource_group_1" {
  provider = azurerm.mgmt
  name     = "appvm-linux-tested-resource-group"
}

data "azurerm_virtual_network" "mgmt-staging-vnet" {
  provider            = azurerm.mgmt
  name                = "app-test-vnet"
  resource_group_name = data.azurerm_resource_group.resource_group_1.name
}

module "vnet_peering" {
  source                        = "../.."
  enabled_diff_subs_peering     = true
  resource_group_1_name         = module.resource_group.resource_group_name
  diff_subs_resource_group_name = data.azurerm_resource_group.resource_group_1.name
  alias_subs_id                 = "0a7be846-xxxxxxxxxxxxxx98787h"
  vnet_1_name                   = module.vnet.vnet_name[0]
  vnet_1_id                     = module.vnet.vnet_id[0]
  vnet_diff_subs_name           = data.azurerm_virtual_network.mgmt-staging-vnet.name
  vnet_diff_subs_id             = data.azurerm_virtual_network.mgmt-staging-vnet.id
}


