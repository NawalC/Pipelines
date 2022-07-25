variable "resource_location" {
  description = "Location of resources"
  type        = list(string)
  default = [
    #"eu-west-2",
    "eu-west-1"
  ]
}

variable "resource_name" {
  description = "Name of resource"
  type        = string
  default     = "web-services"
}

variable "instance_type" {
  description = "Type of instance"
  type        = string
  default     = "t2.micro"
}

variable "instance_count" {
  description = "Number of vms to deploy"
  type        = string
  default     = 1
}

variable "cidr_block" {
  description = "Network address space"
  type        = map(string)
  default = {
    "eu-west-2" = "172.16.0.0/16"
    "eu-west-1" = "172.32.0.0/16"
  }
}

variable "ebs_count" {
  description = "EBS volume count"
  type        = number
  default     = 0
}
