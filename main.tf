module "network" {
    source = "./src/modules/network"
    
    environment          = var.environment
    vpc_cidr             = var.vpc_cidr
    private_subnet1_cidr = var.private_subnet1_cidr
    private_subnet2_cidr = var.private_subnet2_cidr
    public_subnet1_cidr  = var.public_subnet1_cidr
    public_subnet2_cidr  = var.public_subnet2_cidr
    tags                 = var.tags
}