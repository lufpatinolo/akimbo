data "aws_subnet" "public_subnet1" {
  id = var.public_subnet1_id
}

resource "aws_instance" "bastion" {
    ami                         = var.ami_id
    instance_type               = var.instance_type
    iam_instance_profile        = "ec2-ssm-profile"
    subnet_id                   = data.aws_subnet.public_subnet1.id
    vpc_security_group_ids      = [
       aws_security_group.bastion_sg_1.id
    ]
    associate_public_ip_address = true
    tags = {
      "Name" = "Bastion"
    }
}