resource "aws_lambda_function" "lambda_edge_redirect" {
  description      = "Basic HTTP authentication module/function"
  role             = aws_iam_role.lambda_edge_role.arn
  runtime          = "nodejs12.x"
  filename         = "lambda.zip"
  source_code_hash = filebase64sha256("lambda.zip")
  function_name    = "url_redirect"
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