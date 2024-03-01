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
  default     = ["10.0.0.0/16"]
}

variable "dns_server" {
  type        = list(string)
  description = "Liste de serveur DNS utilisé par le VNET (laisser à '[]' pour laisser AZURE se charger du service)"
  default     = []
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
  default = [
    {
      name                                          = "default"
      address_space                                 = ["10.0.0.0/24"]
      private_endpoint_network_policies_enabled     = false
      private_link_service_network_policies_enabled = false
      service_endpoints                             = []
    }
  ]
}