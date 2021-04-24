variable "ami_id" {
}

variable "instance_type" {
}

variable "vpc_id" {
  type = string
  description = "ID of VPC"
}

variable "public_subnet1_id" {
  type = string
  description = "ID of public subnet 1"
}