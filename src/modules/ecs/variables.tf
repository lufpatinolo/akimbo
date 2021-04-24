variable "ecs_task_role" {
    description = "The ARN of IAM role"
    type        = string
    default     = ""
}

variable "ecs_task_execution_role" {
    description = "The ARN of IAM execution role"
    type        = string
    default     = ""
}