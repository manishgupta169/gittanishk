variable "rg_main"{

   type =map(any) 
   default={
    
    "rg1"= {
        name="resource_group_1"
        location="central india"
    }

   }
}

variable "Vn_main"{
    type=map(any)

    default={

   Vn1 = {

               name                = "Vnet_test_1"
               location            = "central india"
               resource_group_name = "resource_group_1"
               address_space       = ["10.0.0.0/16"]

   }


    }

}

variable "Sub_main" {
  type = map(object({
    name                 = string
    virtual_network_name = string
    resource_group_name  = string
    address_prefixes     = list(string)
  }))
}




# variable "VM_main"{

# type=map(any)
# default={

#   Vm1=   { 
#            name="Virtual_machine_test"
#            resource_group_name="resource_group_1"
#           location ="central india"
#   }
# }
# }

variable "linux_vms_test" {
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


variable "Nicmain" {
  type = map(object({
    location            = string
    resource_group_name = string
    ip_configuration = object({
      name                          = string
      subnet_key                    = string
      private_ip_address_allocation = string
      public_ip_key                 = string
    })
  }))
}

# variable "subnet_ids" {
#   type = map(string)
# }

variable "public_ip_data_main" {
  description = "Map of Public IP configurations"
  type = map(object({
    name              = string
    location          = string
    resource_group    = string
    allocation_method = string
  }))
}