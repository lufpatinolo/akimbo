data "aws_vpc" "vpc_main" {
  id = var.vpc_id
}

resource "aws_security_group" "bastion_sg_1" {
    name = "bastion-sg-bastion"
    vpc_id = data.aws_vpc.vpc_main.id
    description = "Permitir SSH"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "bastion-sg-bastion"
    }
}

resource "aws_security_group" "ecs_fargate_sg" {
    name = "ecs_fargate_Sg"
    vpc_id = data.aws_vpc.vpc_main.id
    description = "Permitir http"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "ecs_fargate_sg"
    }
}

resource "aws_security_group" "app_load_sg" {
    name = "alb-sg"
    vpc_id = data.aws_vpc.vpc_main.id
    description = "Permitir http"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "alb-sg"
    }
}
