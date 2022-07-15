variable "resource_name" {
  description = "Name of resources"
  type        = string
}

variable "resource_location" {
  description = "Location of resources"
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

variable "ami" {
  description = "Amazon Machine Image"
  type        = map(string)
  default = {
    "eu-west-2" = "ami-0a491c28ccbfe6698"
    "eu-west-1" = "ami-0a4722105d5286695"
  }
}

variable "resource_instance_count" {
  description = "Number of vms to deploy"
  type        = string
}

variable "device_index" {
  description = "Network interface's position in the attachment order"
  type        = string
  default     = "0"
}

variable "vm_environment" {
  description = "Environment of resources"
  type        = string
  default     = "Production"
}

variable "cidr_block" {
  description = "Network address space"
  type        = string
}

variable availability_zones {
  description = "List of availability zones per region"
  default = {
    "eu-west-2" = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
    "eu-west-1" = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  }
}

variable "ebs_volume_size" {
  description = "EBS volume size"
  type        = number
  default     = 10
}

variable "ebs_type" {
  description = "The type of EBS volume"
  type        = string
  default     = "gp2"
}

variable "ebs_device_name" {
  description = "Device name"
  type        = string
  default     = "xvdf"
}