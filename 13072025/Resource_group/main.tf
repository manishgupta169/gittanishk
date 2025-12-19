resource "azurerm_resource_group" "resource_test" {

for_each=var.rg
name = each.value.name
location=each.value.location
}

output "name" {
  value = {
    for k, rg in azurerm_resource_group.resource_test :
    k => rg.name
  }
}

output "location" {
  value = {
    for k, rg in azurerm_resource_group.resource_test :
    k => rg.location
  }
}