variable "linux_vms" {
  description = "Map of Linux VMs"
  type = map(object({
    resource_group_name   = string
    location              = string
    size                  = string
    # admin_username        = string
    # admin_password       = string
    disable_password_authentication = string
    nic_key               = list(string)
    os_disk = object({
      caching              = string
      storage_account_type = string
    })
    image = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
  }))
}

variable "nic_ids" {
  type = map(string)
}