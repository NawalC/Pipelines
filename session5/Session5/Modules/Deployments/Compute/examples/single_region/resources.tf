

# Create EC2 Instance
module "vm_deployment_eu-west-1" {
  providers = {
  aws = aws.eu-west-1 }
  source            = "../../"
  resource_name     = var.resource_name
  resource_location = "eu-west-1"
  instance_count    = var.instance_count
  instance_type     = var.instance_type
  cidr_block        = lookup(var.cidr_block, "eu-west-1", null)
  ebs_count         = var.ebs_count
}