resource "aws_ebs_volume" "this" {
  count             = var.ebs_count
  availability_zone = var.availability_zone
  size              = var.ebs_volume_size
  type              = var.ebs_type
  encrypted         = true

  tags = {
    Name        = "${local.resource_name}-ebs-${count.index + 1}"
    Environment = var.environment
  }
}

resource "aws_volume_attachment" "this" {
  count       = var.ebs_count
  device_name = var.ebs_device_name[count.index]
  instance_id = var.instance_id  
  volume_id   = aws_ebs_volume.this[count.index].id
}