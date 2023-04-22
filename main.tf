module "dynamo_db_courses" {
  source  = "./modules/dynamodb"
  context = module.default_labels.context
  name    = "courses"
}

module "dynamo_db_authors" {
  source  = "./modules/dynamodb"
  context = module.default_labels.context
  name    = "authors"
}

module "lambda_iam" {
  source  = "./modules/iam"
  context = module.default_labels.context
  name    = "lambda-iam"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : "sts:AssumeRole",
        "Principal" : {
          "Service" : "lambda.amazonaws.com"
        },
        "Effect" : "Allow",
        "Sid" : ""
      }
    ]
  })
  role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "dynamodb:DeleteItem",
          "dynamodb:GetItem",
          "dynamodb:PutItem",
          "dynamodb:Scan",
          "dynamodb:UpdateItem"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

module "lambda" {
  source   = "./modules/lambda"
  context  = module.default_labels.context
  name     = "lambda"
  code_path = "${path.module}/api"
  output_path = "${path.module}/lambda.zip"
  role_arn = module.lambda_iam.role_arn
  handler  = "index.handler"
  runtime  = "nodejs14.x"
}

module "api-gateway" {
  source   = "./modules/api-gateway"
  context  = module.default_labels.context
  name     = "apigateway"
  lambda_uri = module.lambda.invoke_uri
}