variable "rg"{

   type =map(any) 
   default={
    
    "rg1"= {
        name="resource_group_1"
        location="central india"
    }

   }
}