module "network" {
    source = "./src/modules/network"
    
    environment          = var.environment
    vpc_cidr             = var.vpc_cidr
    private_subnet1_cidr = var.private_subnet1_cidr
    public_subnet1_cidr  = var.public_subnet1_cidr
    tags                 = var.tags
}

module "ec2" {
    source = "./src/modules/ec2"

    ami_id             = var.ami_id
    instance_type      = var.instance_type    
    vpc_id             = module.network.vpc_id
    private_subnet1_id = module.network.private_subnet1_id
}