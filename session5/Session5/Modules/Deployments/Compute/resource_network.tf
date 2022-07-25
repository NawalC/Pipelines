module "vm_network" {
  source = "../../Resources/Network"
  vpc_name          = var.resource_name
  resource_location = var.resource_location
  cidr_block        = var.cidr_block
  environment       = var.environment
  
}