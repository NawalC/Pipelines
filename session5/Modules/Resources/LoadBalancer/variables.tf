
variable "resource_location" {
  description = "Location of resources"
  type        = string
}

variable "resource_name" {
  description = "Name of resources"
  type        = string

}

variable "resource_environment" {
  description = "Desired environment for the provisioned resources"
  type        = string

}

variable "load_balancer_type" {
  description = "The type of load balancer to create. Possible values are application, gateway or network."
  type        = string
  default     = "network"

}

variable "internal" {
  description = "Boolean determining if the load balancer is internal or externally facing."
  type        = bool
  default     = false

}

variable "enable_cross_zone_load_balancing" {
  description = "Indicates whether cross zone load balancing should be enabled in application load balancers."
  type        = bool
  default     = false

}

 variable "security_groups" {
   description = "The security groups to attach to the load balancer. Only required for Application Load Balancers"
   type        = string

 }

variable "enable_deletion_protection" {
  description = "If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer. Defaults to false."
  type        = bool
  default     = false

}



variable "enable_http2" {
  description = "Indicates whether HTTP/2 is enabled in application load balancers."
  type        = bool
  default     = true

}

variable "idle_timeout" {
  description = "The time in seconds that the connection is allowed to be idle."
  type        = number
  default     = 60

}



variable "ip_address_type" {
  description = "The type of IP addresses used by the subnets for your load balancer. The possible values are ipv4 and dualstack."
  type        = string
  default     = "ipv4"
}



variable "subnets" {
  description = "A list of subnets to associate with the load balancer. e.g. ['subnet-1a2b3c4d','subnet-1a2b3c4e','subnet-1a2b3c4f']"
  type        = list(string)

}

variable "vpc_id" {
  type = string
  description = "VPC ID"
}

variable "instance_ids" {
  type = list(string)
  description = "Instance IDs"
}


