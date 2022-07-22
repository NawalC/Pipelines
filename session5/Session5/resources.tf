# Create EC2 Instance
module "vm_deployment_eu-west-2" {
  providers = {
  aws = aws.eu-west-2 }
  source            = "./Modules/Deployments/Compute"
  resource_name     = var.resource_name
  resource_location = "eu-west-2"
  instance_count    = var.instance_count
  instance_type     = var.instance_type
  cidr_block        = lookup(var.cidr_block, "eu-west-2", null)
}

# Create EC2 Instance
module "vm_deployment_eu-west-1" {
  providers = {
  aws = aws.eu-west-1 }
  source            = "./Modules/Deployments/Compute"
  resource_name     = var.resource_name
  resource_location = "eu-west-1"
  instance_count    = var.instance_count
  instance_type     = var.instance_type
  cidr_block        = lookup(var.cidr_block, "eu-west-1", null)
}