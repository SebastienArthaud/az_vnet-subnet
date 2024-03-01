# az_vnet-subnet

## Usage

Ce module terraform permet de deployer une VM Azure,

## Example usage 

Pour voir un exemple d'utilisation de ce module ce réferer au dossier "example".
Cloner le repot et effectuer un terraform init/plan/apply afin de voir un exemple de déploiement.

> ne pas oublier de faire un terraform destroy après avoir fait des tests


## Providers

| Name | Version |
|------|---------|
| [azurerm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs) | >= 3.11, < 4.0 |


## Resources provisionés

| Name | Type |
|------|------|
| [azurerm_virtual_network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network_dns_servers](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_dns_servers) | resource |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| virtual_network_name | Nom du VNET | `string` | null | yes |
| resourcegroup_name | Resource group name | `string` | null | yes |
| location | Région de déploiement | `string` | null | yes |
| address_space | Bloc CIDR utilisé par le VNET | `list(string)` | <pre>`["10.0.0.0/16"]`</pre> | no |
| dns_server | Liste de serveur DNS utilisé par le VNET (laisser à '[]' pour laisser AZURE se charger du service) | `list(string)` | [] | no |
| subnet | liste de subnet à créer | <pre>list(object({<br>name = string<br>address_space = list(string)<br>private_endpoint_network_policies_enabled = bool<br>private_link_service_network_policies_enabled = bool<br>service_endpoints = list(string)<br>}))</pre> | <pre>{<br>name = "default"<br>address_space = ["10.0.0.0/24"]<br>private_endpoint_network_policies_enabled = false<br>private_link_service_network_policies_enabled = false<br>service_endpoints = []<br>}</pre> | no |


## Outputs

| Name | Description |
|------|-------------|
| virtual_network_id | ID du VNET créé |
| virtual_network_name | Nom du VNET créé |
| virtual_network_cidr | Blocs CIDR du VNET créé |
| subnets_infos | Infos des subnets créés |
| dns_servers | Liste des IDs de serveir DNS paramétrés dans le VNET créé |

