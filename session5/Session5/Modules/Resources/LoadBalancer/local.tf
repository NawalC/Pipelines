locals {
  location_prefix     = replace(var.resource_location, "/^([a-z]{2})-(.)(.{0,})-([0-9])/", "$1$2$4")
  resource_name       = "${var.resource_name}-${local.location_prefix}"
}