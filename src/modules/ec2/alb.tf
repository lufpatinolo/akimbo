data "aws_subnet" "public_subnet2" {
  id = var.public_subnet2_id
}

resource "aws_lb" "fbd-alb" {
  name               = "fbd-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.app_load_sg.id]
  subnets            = [
      data.aws_subnet.public_subnet1.id,
      data.aws_subnet.public_subnet2.id
      ]

  enable_deletion_protection = false

  tags = {
    Name = "alb-fbd"
  }
}