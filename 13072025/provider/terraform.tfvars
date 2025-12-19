rg_main={

     
    "rg1"= {
        name="resource_group_1"
        location="central india"
    }
}


Vn_main ={


    Vn1 = {

               name                = "Vnet_test_1"
               location            = "central india"
               resource_group_name = "resource_group_1"
               address_space       = ["10.0.0.0/16"]

   }
}

Sub_main ={

sub1={

        name                 = "subnet1"
        resource_group_name  = "resource_group_1"
        virtual_network_name = "Vnet_test_1"
        address_prefixes     = ["10.0.1.0/24"]
     }

}



linux_vms_test = {
  "vm1" = {
    resource_group_name = "resource_group_1"
    location            = "central india"
    size                = "Standard_F2"
    # admin_username      = "key1"
    # admin_password      = "key2"
    disable_password_authentication = false
    nic_key             = ["nic1"]
    
    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    image = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }




}





Nicmain = {
  nic1 = {
    location            = "central india"
    resource_group_name = "resource_group_1"
    ip_configuration = {
      name                          = "internal1"
      subnet_key                    = "sub1"
      private_ip_address_allocation = "Dynamic"
      public_ip_key                 = "ip1"
    }

  }
}   

public_ip_data_main={

ip1 = {
    name              = "acceptanceTestPublicIp1"
    location          = "central india"
    resource_group    = "resource_group_1"
    allocation_method = "Static"
  }

}