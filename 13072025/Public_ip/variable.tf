variable "public_ip_data" {
  description = "Map of Public IP configurations"
  type = map(object({
    name              = string
    location          = string
    resource_group    = string
    allocation_method = string
  }))
}