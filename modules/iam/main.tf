module "labels" {
  source  = "git::https://github.com/cloudposse/terraform-null-label.git?ref=0.24.1"
  context = var.context
  name    = var.name
}

resource "aws_iam_role" "iam" {
  name               = module.labels.id
  assume_role_policy = var.assume_role_policy
}

resource "aws_iam_role_policy" "iam_policy" {
  name   = format("%s-%s", module.labels.id, "policy")
  role   = aws_iam_role.iam.id
  policy = var.role_policy
}