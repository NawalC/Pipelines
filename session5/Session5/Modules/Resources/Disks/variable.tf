variable "environment" {
  description = "Environment for resources"
  type        = string
  default     = "Production"
}

variable "resource_location" {
  description = "Location of resources"
  type        = string
}

variable "resource_name" {
  description = "Name of resources"
  type        = string
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

variable "ebs_count" {
  description = "EBS volume count"
  type        = number
}

variable "ebs_device_name" {
  description = "Device name"
  type        = list
  default     = ["xvdf", "xvdg", "xvdh", "xvdi", "xvdj", "xvdk"]
}

variable "availability_zone" {
  description = "Availability zone for resources"
  type        = string
}

variable "instance_id" {
  description = "EC2 instance ID for attachment"
  type        = string
}