variable environment {
  description = "Environment for resources"
  type        = string
  default     = "Production"
}

variable resource_location {
  description = "Location of resources"
  type        = string
}

variable cidr_block {
  description = "Network address space"
  type        = string
}

variable vpc_name {
  description = "Name of VPC"
  type        = string
  default     = "web-services"
}

variable subnet_netbits {
  description = "Netbits by which to extend VPC CIDR"
  type        = number
  default     = 8
}

variable availability_zones {
  description = "List of availability zones per region"
  default = {
    "eu-west-2" = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
    "eu-west-1" = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  }
}