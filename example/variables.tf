variable "resourcegroup_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Région de déploiement"
}

variable "virtual_network_name" {
  type        = string
  description = "Nom du VNET"
}

variable "address_space" {
  type        = list(string)
  description = "Bloc CIDR utilisé par le VNET"
}

variable "dns_server" {
  type        = list(string)
  description = "Liste de serveur DNS utilisé par le VNET (laisser à '[]' pour laisser AZURE se charger du service)"
}

variable "subnet" {
  type = list(object({
    name                                          = string
    address_space                                 = list(string)
    private_endpoint_network_policies_enabled     = bool
    private_link_service_network_policies_enabled = bool
    service_endpoints                             = list(string)
  }))
  description = "liste de subnet à créer"
}