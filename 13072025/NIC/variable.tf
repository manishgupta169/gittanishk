variable "NIC1" {
  type = map(object({
    location            = string
    resource_group_name = string
    ip_configuration = object({
      name                          = string
      subnet_key                    = string
      private_ip_address_allocation = string
      public_ip_key = string
      
    })
  }))
}

variable "subnet_ids" {
  type = map(string)
}

variable "public_ip_addresses" {
  type = map(string)
}