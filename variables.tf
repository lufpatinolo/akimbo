variable "environment" {  
}

variable "vpc_cidr" {
}

variable "public_subnet1_cidr" {
}

variable "public_subnet2_cidr" {
}

variable "region" {
    default = "us-east-1"
}

variable "tags" {
}

#EC2
variable "ami_id" {
}

variable "instance_type" {
}

variable "public_subnet1_id" {
  type = string
  description = "ID of public subnet 1"
  default = ""
}

variable "public_subnet2_id" {
  type = string
  description = "ID of public subnet 2"
  default = ""
}