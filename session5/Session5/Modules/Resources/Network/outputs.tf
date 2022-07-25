output vpc_id {
  value = aws_vpc.this.id
}

output public_subnets {
  value =  tolist(aws_subnet.public[*].id)
}

output public_subnets_cidr {
  # Result is a map of subnet id to cidr block, e.g.
  # { "subnet_1234" => "10.0.1.0/4", ...}
  value = {
    for subnet in aws_subnet.public :
    subnet.id => subnet.cidr_block
  }
}

output private_security_group_id {
  description = "Default security group id"
  value       = aws_security_group.default.id
}

output public_security_group_id  {
  value = aws_security_group.private.id
  
}