output "vnet_peer_1_id" {
  value       = azurerm_virtual_network_peering.peering[*].id
  description = "The id of the newly created virtual network peering in on first virtual netowork."
}

output "vnet_peer_2_id" {
  value       = azurerm_virtual_network_peering.peering_back[*].id
  description = "The id of the newly created virtual network peering in on second virtual netowork."
}

output "vnet_peer_1_name" {
  value       = azurerm_virtual_network_peering.peering[*].name
  description = "The name of the newly created virtual network peering in on first virtual netowork."
}

output "vnet_peer_2_name" {
  value       = azurerm_virtual_network_peering.peering_back[*].name
  description = "The name of the newly created virtual network peering in on second virtual netowork."
}

output "vnet_peer_diff_subs_name" {
  value       = azurerm_virtual_network_peering.peering_back_diff_subs[*].name
  description = "The name of the newly created virtual network peering in on different subscription virtual netowork."
}

output "vnet_peer_diff_subs_id" {
  value       = azurerm_virtual_network_peering.peering_back_diff_subs[*].id
  description = "The id of the newly created virtual network peering in on different subscription virtual netowork."
}
