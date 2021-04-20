module "network" {
    source = "./src/modules/network"
    
    environment     = var.environment
    cidr            = var.vpc_cidr
    private_subnets = var.private_subnets

    tags = {
        Owner = "akimbo"
    }
}