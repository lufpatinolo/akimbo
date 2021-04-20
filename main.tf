module "network" {
    source = "./src/modules/network"
    
    environment     = var.environment
    vpc_cidr        = var.vpc_cidr
}