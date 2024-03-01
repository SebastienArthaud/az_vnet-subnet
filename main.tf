resource "azurerm_virtual_network" "virtual_network" {
  name                = var.virtual_network_name
  location            = var.location
  resource_group_name = var.resourcegroup_name
  address_space       = var.address_space
}

resource "azurerm_subnet" "subnet" {
  for_each = var.subnet != [] ? {
    for index, sub in var.subnet:
      sub.name => sub
  } : {}
  name                                          = each.value.name
  resource_group_name                           = var.resourcegroup_name
  virtual_network_name                          = resource.azurerm_virtual_network.virtual_network.name
  address_prefixes                              = each.value.address_space
  private_endpoint_network_policies_enabled     = each.value.private_endpoint_network_policies_enabled
  private_link_service_network_policies_enabled = each.value.private_link_service_network_policies_enabled
  service_endpoint_policy_ids                   = each.value.private_link_service_network_policies_enabled == true && each.value.service_endpoints != [] ? toset(each.value.service_endpoints) : null

}

resource "azurerm_virtual_network_dns_servers" "dns_server" {
  count              = var.dns_server == [] ? 0 : 1
  virtual_network_id = resource.azurerm_virtual_network.virtual_network.id
  dns_servers        = var.dns_server
}

