#defining subnet module

resource "aws_subnet" "main" {
  for_each          = var.subnets
  vpc_id            = var.vpc_id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.av_zone

  tags = {
    Name = join("-", [var.prefix, "subnet"])
  }
}

variable "prefix" {
    type = string
}