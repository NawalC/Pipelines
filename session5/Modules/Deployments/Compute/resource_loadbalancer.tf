module "load_balancer" {
  source                           = "../../Resources/LoadBalancer"
  resource_location                = var.resource_location
  resource_environment             = var.environment
  resource_name                    = var.resource_name
  security_groups                  = module.vm_network.public_security_group_id
  subnets                          = tolist(module.vm_network.public_subnets)
  vpc_id                           = module.vm_network.vpc_id
  instance_ids                     = aws_instance.vm-window-server[*].id
}