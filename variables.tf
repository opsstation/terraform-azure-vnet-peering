#Module      : LABEL
#Description : Terraform label module variable

## peering
variable "enabled_peering" {
  type        = bool
  default     = false
  description = "Set to false to prevent the module from creating any resources."
}

variable "vnet_1_name" {
  type        = string
  default     = ""
  description = "The name of the virtual network. Changing this forces a new resource to be created."
}

variable "vnet_2_id" {
  type        = string
  default     = ""
  description = "The full Azure resource ID of the remote virtual network. Changing this forces a new resource to be created."
}

variable "vnet_1_id" {
  type        = string
  default     = ""
  description = "The full Azure resource ID of the remote virtual network. Changing this forces a new resource to be created."
}

variable "vnet_2_name" {
  type        = string
  default     = ""
  description = "The name of the remote virtual network."
}

variable "allow_virtual_network_access" {
  type        = bool
  default     = true
  description = "Controls if the VMs in the remote virtual network can access VMs in the local virtual network."
}

variable "allow_forwarded_traffic_vnet1" {
  type        = bool
  default     = false
  description = "Controls if forwarded traffic from VMs in the remote virtual network is allowed"
}

variable "allow_forwarded_traffic_vnet2" {
  type        = bool
  default     = false
  description = "Controls if forwarded traffic from VMs in the remote virtual network is allowed"
}
variable "allow_forwarded_traffic_vnet_diff_subs" {
  type        = bool
  default     = false
  description = "Controls if forwarded traffic from VMs in the remote virtual network is allowed"
}

variable "allow_gateway_transit_vnet1" {
  type        = bool
  default     = false
  description = "Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network."
}

variable "allow_gateway_transit_vnet2" {
  type        = bool
  default     = false
  description = "Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network."
}
variable "allow_gateway_transit_vnet_diff_subs" {
  type        = bool
  default     = false
  description = "Controls gatewayLinks can be used in the different subscription virtual network’s link to the local virtual network."
}

variable "use_remote_gateways_vnet1" {
  type        = bool
  default     = false
  description = "Controls if remote gateways can be used on the local virtual network"
}

variable "use_remote_gateways_vnet2" {
  type        = bool
  default     = false
  description = "Controls if remote gateways can be used on the local virtual network"
}

variable "use_remote_gateways_vnet_diff_subs" {
  type        = bool
  default     = false
  description = "Controls if remote gateways can be used on the different subscription virtual network"
}

variable "resource_group_1_name" {
  type        = string
  default     = ""
  description = "The name of 1st existing resource group to be imported."
}

variable "resource_group_2_name" {
  type        = string
  default     = ""
  description = "The name of 2nd existing resource group to be imported."
}

variable "different_rg" {
  type        = bool
  default     = false
  description = "Flag to tell whether peering is to be done in same in resource group or different resource group "
}

variable "enabled_diff_subs_peering" {
  type    = bool
  default = false
}
variable "vnet_diff_subs_name" {
  type        = string
  default     = ""
  description = "The name of the remote virtual network."
}
variable "alias_subs_id" {
  type        = string
  default     = ""
  description = "Alias for remote provider in module."
}
variable "diff_subs_resource_group_name" {
  type        = string
  default     = ""
  description = "The name of remote resource group to be imported."
}

variable "vnet_diff_subs_id" {
  type        = string
  default     = ""
  description = "The id of the remote virtual network."
}

