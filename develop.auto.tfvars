#Network Module
environment          = "develop"
vpc_cidr             = "10.1.0.0/27"
public_subnet1_cidr  = "10.1.0.0/28"
public_subnet2_cidr  = "10.1.0.16/28"
tags                 = "VPC Develop"

#EC2 Module
ami_id        = "ami-0742b4e673072066f"
instance_type = "t2.large"