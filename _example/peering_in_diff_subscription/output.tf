output "vnet_peer_1_id" {
  value       = module.vnet_peering.vnet_peer_1_id
  description = "The id of the newly created virtual network peering in on first virtual netowork."
}

output "vnet_peer_1_name" {
  value       = module.vnet_peering.vnet_peer_1_name
  description = "The name of the newly created virtual network peering in on first virtual netowork."
}

output "vnet_peer_diff_subs_id" {
  value       = module.vnet_peering.vnet_peer_diff_subs_id
  description = "The id of the newly created virtual network peering in on different subscription virtual network."
}

output "vnet_peer_diff_subs_name" {
  value       = module.vnet_peering.vnet_peer_diff_subs_name
  description = "The name of the newly created virtual network peering in on different subscription virtual network."
}
