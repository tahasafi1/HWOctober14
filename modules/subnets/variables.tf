variable "subnets" {
  description = "supposed to create 3 subnets with this diff. w/ av zones and cidr blocks"
  type = map(object({
    cidr_block = string
    av_zone    = string
  }))
  default = {}
}

variable "vpc_id" {
  type    = string
  default = ""
}