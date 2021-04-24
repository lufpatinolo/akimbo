data "aws_subnet" "public_subnet2" {
  id = var.public_subnet2_id
}

resource "aws_lb" "fbd-alb" {
  name               = "fbd-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.bastion-sg-1.id]
  subnets            = [
      data.aws_subnet.public_subnet1.id,
      data.aws_subnet.public_subnet2.id
      ]

  enable_deletion_protection = true

  tags = {
    Environment = "production"
  }
}