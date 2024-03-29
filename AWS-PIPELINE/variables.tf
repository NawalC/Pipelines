variable "resource_name" {
  description = "Name of resources"
  type        = string
  default     = "WebServices"
}

variable "instance_type" {
  description = "Type of instance"
  type        = string
  default     = "t2.micro"
}

variable "resource_instance_count" {
  description = "Number of vms to deploy"
  type        = string
  default     = 3
}

variable "cidr_block" {
  description = "Network address space"
  type        = map(string)
  default = {
    "eu-west-2" = "172.16.0.0/16"
    "eu-west-1" = "172.32.0.0/16"
  }
}