# create a network interface
resource "aws_network_interface" "ni" {
  count     = var.instance_count
  subnet_id = module.vm_network.public_subnets[count.index % local.subnet_count]
  security_groups = [local.security_group_id]

  tags = {
    Name        = "${local.resource_name}-eni-${count.index + 1}"
    Environment = var.environment
  }
}

# Create EC2 Instance
resource "aws_instance" "vm-window-server" {
  count             = var.instance_count
  ami               = local.ami
  instance_type     = var.instance_type
  availability_zone = local.availability_zones[count.index % local.subnet_count]


  network_interface {
    network_interface_id = aws_network_interface.ni[count.index].id
    device_index         = var.device_index

  }

  # root disk
  root_block_device {
    volume_size           = var.root_volume_size
    delete_on_termination = true
    encrypted             = true

    tags = {
      Name        = "${local.resource_name}-rootvol-${count.index + 1}"
      Environment = var.environment
    }
  }
  
  tags = {
    Name        = "${local.resource_name}-ec2-${count.index + 1}"
    Environment = var.environment
  }
}