#defining vpc module

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = join("-", [var.prefix, "vpc"])
  }
}

variable "prefix" {
    type = string
}

output "vpc_id1" {
  value = aws_vpc.main.id
}

output "vpc_cidr1" {
  value = aws_vpc.main.cidr_block
}
