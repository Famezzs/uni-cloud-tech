module "labels" {
  source  = "git::https://github.com/cloudposse/terraform-null-label.git?ref=0.24.1"
  context = var.context
  name    = var.name
}

resource "aws_cloudwatch_metric_alarm" "metric_alarn" {
  alarm_name                = module.labels.id
  comparison_operator       = var.comparison_operator
  evaluation_periods        = 2
  metric_name               = var.metric_name
  namespace                 = "AWS/EC2"
  period                    = 120
  statistic                 = var.statistic
  threshold                 = 80
  insufficient_data_actions = []
}