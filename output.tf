output "virtual_network_id" {
  description = "ID du VNET créé"
  value       = resource.azurerm_virtual_network.virtual_network.id
}

output "virtual_network_name" {
  description = "Nom du VNET créé"
  value       = resource.azurerm_virtual_network.virtual_network.name
}

output "virtual_network_cidr" {
  description = "Blocs CIDR du VNET créé"
  value       = resource.azurerm_virtual_network.virtual_network.address_space
}

output "subnets_infos" {
  description = "Infos des subnets créés"
  value       = resource.azurerm_subnet.subnet != [] ? resource.azurerm_subnet.subnet : null
}

output "dns_servers" {
  description = "Liste des IDs de serveir DNS paramétrés dans le VNET créé"
  value       = resource.azurerm_virtual_network_dns_servers.dns_server != [] ? resource.azurerm_virtual_network_dns_servers.dns_server : null
}