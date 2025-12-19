resource "azurerm_public_ip" "Public_ip" {
  for_each = var.public_ip_data
  name                = each.value.name
  resource_group_name = each.value.resource_group
  location            = each.value.location
  allocation_method   = each.value.allocation_method
}

output "public_ip_addresses" {
  description = "Map of Public IP names to their IP addresses"
  value = {
    for key, ip1 in azurerm_public_ip.Public_ip :
    key => ip1.id
  }
}