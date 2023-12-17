variable "vpc_cidr" {
  type        = string
  description = "this means the user has to define a VPC CIDR here"
  default     = ""
}

variable "vpc_name" {
  type        = string
  description = "signify name of vpc"
  default     = ""
}

# variable "vpc_id" {
#     type = string
#     default = ""
# }