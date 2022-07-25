locals {
  location_prefix     = replace(var.resource_location, "/^([a-z]{2})-(.)(.{0,})-([0-9])/", "$1$2$4")
  resource_name       = "${var.resource_name}-${local.location_prefix}"
  availability_zones  = var.availability_zones[var.resource_location]
  subnet_count        = length(local.availability_zones)
  ami                 = var.ami[var.resource_location]
  security_group_id   = module.vm_network.public_security_group_id
}