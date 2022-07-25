variable "resource_location" {
  description = "Location of resources"
  type        = string
}

variable "resource_name" {
  description = "Name of resources"
  type        = string
}

variable "instance_type" {
  description = "Type of instance"
  type        = string
  default     = "t2.micro"
}

variable "root_volume_size" {
  description = "Size of root volume"
  type        = string
  default     = "30"
}

variable "ebs_count" {
  description = "EBS volume count"
  type        = number
  default     = 2
}


variable "ebs_volume_size" {
  description = "EBS volume size"
  type        = number
  default     = 10
}


variable "ami" {
  description = "Amazon Machine Image"
  type        = map(string)
  default = {
    "eu-west-2" = "ami-0a491c28ccbfe6698"
    "eu-west-1" = "ami-0a4722105d5286695"
  }
}

variable "instance_count" {
  description = "Number of vms to deploy"
  type        = string
}

variable "device_index" {
  description = "Network interface's position in the attachment order"
  type        = string
  default     = "0"
}

variable "environment" {
  description = "Environment for resources"
  type        = string
  default     = "Production"
}

variable availability_zones {
  description = "List of availability zones per region"
  default = {
    "eu-west-2" = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
    "eu-west-1" = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  }
}

variable cidr_block {
  description = "Network address space"
  type        = string
}

variable ip_association {
  description = "IPV4 Address"
  type        = string
  default     = null
}