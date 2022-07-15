locals {
  location_prefix   = replace(var.resource_location, "/^([a-z]{2})-(.)(.{0,})-([0-9])/", "$1$2$4")
  resource_name     = "${var.resource_name}-${local.location_prefix}"
  platform_location = var.availability_zones[var.resource_location]
  subnet_count      = length(local.platform_location)
  subnet_prefix     = [for subnet in local.platform_location : replace(subnet, "/^([a-z]{2})-(.)(.{0,})-([0-9][a-z])/", "$1$2$4")]
  ami               = var.ami[var.resource_location]
}