terraform {
  required_providers{
    azurerm={
    
    source="hashicorp/azurerm"
    version="4.29.0"


    }


    }
  }

provider "azurerm" {

  features{}
  subscription_id = "89d45acd-504f-4322-84bb-b0959bce676d"


}

module "RG1"{
 source = "../Resource_group"
 rg=var.rg_main

}

module "Vnet_1"{
depends_on = [ module.RG1 ]
source = "../Vnet"
Vn=var.Vn_main


}


module "Subnet_1"{
depends_on = [ module.RG1,module.Vnet_1 ]
source = "../Subnet"
sub=var.Sub_main


}

module "NIC_1"{
depends_on = [ module.RG1,module.Subnet_1 ]
source = "../NIC"
NIC1= var.Nicmain
subnet_ids = module.Subnet_1.subnet_ids
public_ip_addresses  = module.public_ip.public_ip_addresses

}


module "VM1" {
 depends_on = [module.RG1,module.NIC_1 ]
 source = "../VM"
 linux_vms = var.linux_vms_test
 nic_ids = module.NIC_1.nic_ids
 


}

module "public_ip"{
depends_on = [ module.RG1 ]
source = "../Public_ip"
public_ip_data =var.public_ip_data_main

}
