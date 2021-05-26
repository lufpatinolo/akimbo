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

resource "aws_alb_target_group" "fbd_ecs_target" {
  name        = "fbd-ecs-target"
  port        = 80  
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = data.aws_vpc.vpc_main.id
}

resource "aws_alb_listener" "fbd_alb_listener" {
  load_balancer_arn = aws_lb.fbd-alb.arn
  port = 80
  
  protocol = "HTTP"
  default_action {
    target_group_arn = aws_alb_target_group.fbd_ecs_target.arn
    type = "forward"

  }
}
