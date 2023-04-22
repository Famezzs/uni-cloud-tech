module "labels" {
  source  = "git::https://github.com/cloudposse/terraform-null-label.git?ref=0.24.1"
  context = var.context
  name    = var.name
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  output_path = var.output_path
  source_dir = var.code_path
}

resource "aws_lambda_function" "lambda" {
  filename      = var.output_path
  function_name = module.labels.id
  role          = var.role_arn
  handler       = var.handler
  runtime       = var.runtime

  depends_on = [
    data.archive_file.lambda_zip
  ]
}