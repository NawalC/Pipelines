locals {
  location_prefix     = replace(var.resource_location, "/^([a-z]{2})-(.)(.{0,})-([0-9])/", "$1$2$4")
  resource_name       = "${var.vpc_name}-${local.location_prefix}"
  availability_zones  = var.availability_zones[var.resource_location]
  subnet_count        = length(local.availability_zones)
  subnet_prefix       = [for subnet in local.availability_zones : replace(subnet, "/^([a-z]{2})-(.)(.{0,})-([0-9][a-z])/", "$1$2$4")]
}