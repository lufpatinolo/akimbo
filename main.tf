module "network" {
    source = "./src/modules/network"
    
    environment          = var.environment
    vpc_cidr             = var.vpc_cidr
    public_subnet1_cidr  = var.public_subnet1_cidr
    public_subnet2_cidr  = var.public_subnet2_cidr
    tags                 = var.tags
}

module "ec2" {
    source = "./src/modules/ec2"

    ami_id             = var.ami_id
    instance_type      = var.instance_type    
    vpc_id             = module.network.vpc_id
    public_subnet1_id  = module.network.public_subnet1_id
    public_subnet2_id  = module.network.public_subnet2_id
}

module "iam" {
    source = "./src/modules/iam"   
}

module "frontend" {
    source = "./src/modules/frontend"   
    arn_certificate      = module.route53.arn_certificate
    arn_certificate_prod = module.route53.arn_certificate_prod
}

module "route53" {
    source = "./src/modules/route53"   
    cloudfront_dns          = module.frontend.cloudfront_dns
    cloudfront_zone_id      = module.frontend.cloudfront_zone_id
    cloudfront_dns_prod     = module.frontend.cloudfront_dns_prod
    cloudfront_zone_id_prod = module.frontend.cloudfront_zone_id_prod
}