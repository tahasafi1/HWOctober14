#create modules subnet and vpc here calling from other local files in directories

module "vpc_module" {
  source   = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  prefix = local.prefix
}

locals {
    prefix = "csa-23"
}

module "subnets_module" {
  source = "./modules/subnets"
  vpc_id = module.vpc_module.vpc_id1
  subnets = {
    subnet_1 = {
      cidr_block = "10.0.1.0/24"
      av_zone    = "us-east-1a"
    }
    subnet_2 = {
      cidr_block = "10.0.2.0/24"
      av_zone    = "us-east-1b"
    }
    subnet_3 = {
      cidr_block = "10.0.3.0/24"
      av_zone    = "us-east-1c"
    }
  }
  prefix = local.prefix
} 

output "bambam_vpc" {
    value = module.vpc_module.vpc_id1
}

# variable "config" {
#   type = map(string)
#   default = {
#     region = "us-east-1"
#     intance_type = "t1.small"
#     environment = "development"
#     availability_zone = "us-east-1b"
#   }
# }


# resource "aws_instance" "example" {
#   ami = "ami-0c55b159cbfafe1f0"
#   instance_type = lookup(var.config, "instance_type", "t2.micro")
# }