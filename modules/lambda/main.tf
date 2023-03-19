module "labels" {
  source  = "git::https://github.com/cloudposse/terraform-null-label.git?ref=0.24.1"
  context = var.context
  name    = var.name
}

resource "aws_lambda_function" "test_lambda" {
  filename      = var.filename
  function_name = module.labels.id
  role          = var.role_arn
  handler       = var.handler
  runtime       = var.runtime
}