resource "azurerm_virtual_network" "Vnet_test" {
  for_each=var.Vn
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space

}

output "vnet_ids" {
  description = "IDs of all created Virtual Networks"
  value = {
    for key, vnet in azurerm_virtual_network.Vnet_test :
    key => vnet.id
  }
}