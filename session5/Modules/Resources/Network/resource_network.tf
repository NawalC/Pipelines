# Create virtual private cloud
resource "aws_vpc" "this" {
  cidr_block = var.cidr_block

  tags = {
    Name        = "${local.resource_name}-vpc"
    Environment = var.environment
  }
}

# Create public subnets
resource "aws_subnet" "public" {
  count                   = local.subnet_count
  vpc_id                  = aws_vpc.this.id
  availability_zone       = local.availability_zones[count.index]
  cidr_block              = cidrsubnet(var.cidr_block, var.subnet_netbits, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.vpc_name}-${local.subnet_prefix[count.index]}-subnet"
    Environment = var.environment
  }
}

# Create private subnets 
resource "aws_subnet" "private" {
  count                   = local.subnet_count
  vpc_id                  = aws_vpc.this.id
  availability_zone       = local.availability_zones[count.index]
  cidr_block              = cidrsubnet(var.cidr_block, var.subnet_netbits, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.vpc_name}-${local.subnet_prefix[count.index]}-subnet-private"
    Environment = var.environment
  }
}

# Create public route table, routes & association
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.vpc_name}-pub-rtb"
  }
}

# Create private route table, routes & association
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.vpc_name}-pub-rtb-private"
  }
}


resource "aws_route_table_association" "public" {
  count           = local.subnet_count
  subnet_id       = element(aws_subnet.public.*.id, count.index)
  route_table_id  = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count           = local.subnet_count
  subnet_id       = element(aws_subnet.private.*.id, count.index)
  route_table_id  = aws_route_table.private.id
}

resource "aws_route" "internet" {
  route_table_id          = aws_route_table.public.id
  destination_cidr_block  = "0.0.0.0/0"
  gateway_id              = aws_internet_gateway.this.id
}

# Create internet gateway
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${local.resource_name}-iwg"
  }
}

# Create default security group & rules for VPC resources
resource "aws_security_group" "default" {
  name        = "${local.resource_name}-default-sg"
  description = "Default security group for VPC resources"
  vpc_id      = aws_vpc.this.id

  tags = {
    "Name" = "${local.resource_name}-default-sg"
  }
}

resource "aws_security_group_rule" "ingress" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.default.id
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.default.id
}

## private security group for vpc 

resource "aws_security_group" "private" {
  name        = "${local.resource_name}-default-sg"
  description = "private security group for VPC resources"
  vpc_id      = aws_vpc.this.id

  tags = {
    "Name" = "${local.resource_name}-default-sg"
  }
}

resource "aws_security_group_rule" "privateingress" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = [var.cidr_block]
  security_group_id = aws_security_group.private.id
}

resource "aws_security_group_rule" "privateegress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = [var.cidr_block]
  security_group_id = aws_security_group.private.id
}
