#Network Module
environment          = "develop"
vpc_cidr             = "10.0.0.0/16"
private_subnet1_cidr = "10.0.1.0/24"
public_subnet1_cidr  = "10.0.2.0/24"
tags                 = "VPC Develop"

#EC2 Module
ami_id        = "ami-0742b4e673072066f"
instance_type = "t2.micro"