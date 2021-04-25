data "aws_subnet" "public_subnet1" {
  id = var.public_subnet1_id
}

data "aws_subnet" "public_subnet2" {
  id = var.public_subnet2_id
}

data "aws_security_group" "ecs_fargate_sg" {
  id = var.ecs_fargate_sg
}

resource "aws_ecs_cluster" "fbd-cluster" {
  name = "fbd-cluster"
}

resource "aws_ecs_task_definition" "fbd_task_definition" {
  family                   = "fbd-task-definition"
  task_role_arn            = var.ecs_task_role
  execution_role_arn       = var.ecs_task_execution_role
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "1024"
  requires_compatibilities = [ "FARGATE" ]
  container_definitions = jsonencode([
    {
      name      = "first"
      image     = "lufpatinolo/application-calc"
      cpu       = 10
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_ecs_service" "calc" {
  name                               = "calc"
  task_definition                    = aws_ecs_task_definition.fbd_task_definition.arn
  desired_count                      = 1
  launch_type                        = "FARGATE"
  cluster                            = aws_ecs_cluster.fbd-cluster.id
  platform_version                   = "LATEST"
  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100
  scheduling_strategy                = "REPLICA"
  network_configuration {
    assign_public_ip = true
    security_groups  = [data.aws_security_group.ecs_fargate_sg.id]
    subnets          = [data.aws_subnet.public_subnet1.id,data.aws_subnet.public_subnet2.id]
  }
  lifecycle {
    ignore_changes = [
      task_definition,
      desired_count
    ]
  }
}