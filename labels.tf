module "default_labels" {
  source      = "git::https://github.com/cloudposse/terraform-null-label.git?ref=0.24.1"
  namespace   = var.namespace
  environment = var.environment
  delimiter   = var.delimiter
}