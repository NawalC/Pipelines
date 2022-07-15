# create a network interface
resource "aws_network_interface" "ni" {
  count     = var.resource_instance_count
  subnet_id = aws_subnet.public[count.index % local.subnet_count].id

  tags = {
    Name        = "${local.resource_name}-eni-${count.index + 1}"
    Environment = var.vm_environment
  }
}

# Create EC2 Instance
resource "aws_instance" "vm-window-server" {
  count             = var.resource_instance_count
  ami               = local.ami
  instance_type     = var.instance_type
  availability_zone = local.platform_location[count.index % local.subnet_count]


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
      Environment = var.vm_environment
    }
  }

  tags = {
    Name        = "${local.resource_name}-ec2-${count.index + 1}"
    Environment = var.vm_environment
  }
}

# Create ebs
resource "aws_ebs_volume" "this" {
  count             = var.resource_instance_count
  availability_zone = local.platform_location[count.index % local.subnet_count]
  size              = var.ebs_volume_size
  type              = var.ebs_type
  encrypted         = true

  tags = {
    Name        = "${local.resource_name}-ebs-${count.index + 1}"
    Environment = var.vm_environment
  }
}

resource "aws_volume_attachment" "this" {
  count       = var.resource_instance_count
  device_name = var.ebs_device_name
  instance_id = aws_instance.vm-window-server[count.index].id
  volume_id   = aws_ebs_volume.this[count.index].id
}