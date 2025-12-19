variable "Vn"{
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