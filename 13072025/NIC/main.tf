resource "azurerm_network_interface" "Nic_test" {
  for_each = var.NIC1
  name                = each.key
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  ip_configuration {
    name                          = each.value.ip_configuration.name
    subnet_id                     = var.subnet_ids[each.value.ip_configuration.subnet_key]
    private_ip_address_allocation = each.value.ip_configuration.private_ip_address_allocation
    public_ip_address_id          = var.public_ip_addresses[each.value.ip_configuration.public_ip_key]
   
  }
}


output "nic_ids" {
  value = {
    for k, nic1 in azurerm_network_interface.Nic_test :
    k => nic1.id
  }
}

