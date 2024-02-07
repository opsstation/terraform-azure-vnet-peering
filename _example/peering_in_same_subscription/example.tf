provider "azurerm" {
  features {}
}



module "resource_group_1" {
  source      = "git::https://github.com/opsstation/terraform-azure-resource-group.git?ref=v1.0.0"
  name        = "app"
  environment = "test"
  location    = "West Europe"
}


module "resource_group_2" {
  source      = "git::https://github.com/opsstation/terraform-azure-resource-group.git?ref=v1.0.0"
  name        = "app-2"
  environment = "test"
  location    = "East US"
}



#Vnet
module "vnet" {
  source              = "git::https://github.com/opsstation/terraform-azure-vnet.git?ref=v1.0.0"
  name                = "vnet-1"
  environment         = "test"
  resource_group_name = module.resource_group_1.resource_group_name
  location            = module.resource_group_1.resource_group_location
  address_spaces      = ["10.0.0.0/16"]
}

#Vnet
module "vnet_remote" {
  source              = "git::https://github.com/opsstation/terraform-azure-resource-group.git?ref=v1.0.0"
  name                = "vnet-2"
  environment         = "test"
  resource_group_name = module.resource_group_2.resource_group_name
  location            = module.resource_group_2.resource_group_location
  address_spaces      = ["20.0.0.0/16"]
}

module "vnet_peering" {
  source                = "../.."
  enabled_peering       = true
  resource_group_1_name = module.resource_group_1.resource_group_name
  resource_group_2_name = module.resource_group_2.resource_group_name
  different_rg          = true
  vnet_1_name           = module.vnet.vnet_name[0]
  vnet_1_id             = module.vnet.vnet_id[0]
  vnet_2_name           = module.vnet_remote.vnet_name[0]
  vnet_2_id             = module.vnet_remote.vnet_id[0]
}
