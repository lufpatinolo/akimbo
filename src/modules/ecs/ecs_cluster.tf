resource "aws_ecs_cluster" "fbd-cluster" {
  name = "fbd-cluster"
}

resource "aws_ecs_task_definition" "fbd-task-definition" {
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
}