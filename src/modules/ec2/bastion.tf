data "aws_subnet" "private_subnet1" {
  id = var.private_subnet1_id
}

resource "aws_instance" "bastion" {
    ami                         = var.ami_id
    instance_type               = var.instance_type
    subnet_id                   = data.aws_subnet.private_subnet1.id
    vpc_security_group_ids      = [
       aws_security_group.bastion-sg-1.id 
    ]
    #key_name                    = "bastion-key"
    associate_public_ip_address = false
    tags = {
      "Name" = "Bastion"
    }

}