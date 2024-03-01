virtual_network_name = "vnet-seb"
resourcegroup_name   = "rg-seb"
location             = "uksouth"
address_space        = ["172.16.0.0/16"]
subnet = [{
  name                                          = "VMSubnet"
  address_space                                 = ["172.16.0.0/24"]
  private_endpoint_network_policies_enabled     = false
  private_link_service_network_policies_enabled = false
  service_endpoints = []
  },
  {
    name                                          = "GatewaySubnet"
    address_space                                 = ["172.16.1.0/27"]
    private_endpoint_network_policies_enabled     = false
    private_link_service_network_policies_enabled = false
    service_endpoints = []
  },
  {
    name                                          = "AzureFirewallSubnet"
    address_space                                 = ["172.16.1.32/26"]
    private_endpoint_network_policies_enabled     = false
    private_link_service_network_policies_enabled = false
    service_endpoints = []
  }
]

dns_server = [ "172.16.0.10", "172.16.0.11" ]