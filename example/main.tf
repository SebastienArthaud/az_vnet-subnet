module "az_vnet-subnet" {
  source               = "../../az_vnet-subnet"
  virtual_network_name = var.virtual_network_name
  resourcegroup_name   = var.resourcegroup_name
  location             = var.location
  address_space        = var.address_space
  dns_server           = var.dns_server
  subnet               = var.subnet
}