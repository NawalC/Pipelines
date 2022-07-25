module "ebs" {
  count             = var.instance_count
  source            = "../../Resources/Disks"
  resource_name     = var.resource_name
  resource_location = var.resource_location
  ebs_count         = var.ebs_count
  ebs_volume_size   = var.ebs_volume_size
  environment       = var.environment
  availability_zone = local.availability_zones[count.index % local.subnet_count]
  instance_id       = aws_instance.vm-window-server[count.index].id
}