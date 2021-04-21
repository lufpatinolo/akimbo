data "aws_vpc" "vpc_main" {
  id = var.vpc_id
}

resource "aws_security_group" "bastion-sg-1" {
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

