resource "aws_iam_role" "lambda_edge_role" {
  name = "lambda_edge_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "lambda.amazonaws.com",
          "edgelambda.amazonaws.com"
        ]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_lambda_function" "lambda_edge" {
  description      = "Basic HTTP authentication module/function"
  role             = aws_iam_role.lambda_edge_role.arn
  runtime          = "nodejs12.x"
  filename         = "lambda.zip"
  source_code_hash = filebase64sha256("lambda.zip")
  function_name    = "scHeaders"
  handler          = "index.handler"
  timeout          = 1
  memory_size      = 128
  publish          = true

  lifecycle {
      ignore_changes = [
          handler,
          source_code_hash,
          runtime,
          filename
      ]
  }
}