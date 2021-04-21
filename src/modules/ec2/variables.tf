variable "ami_id" {
}

variable "instance_type" {
}

variable "vpc_id" {
  type = string
  description = "ID of VPC"
}

variable "private_subnet1_id" {
  type = string
  description = "ID of private subnet 1"
}