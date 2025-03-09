provider "aws" {
    region = "us-east-1"
}

resource "aws_sns_topic" "sns_alarm_billing_topic" {
  name = "billing_topic"
  display_name = "Aws Billing Warning"
}

resource "aws_sns_topic_subscription" "sns_alarm_billing_sub" {
    protocol = "email"
    endpoint = "${var.accountEmail}"
    topic_arn = aws_sns_topic.sns_alarm_billing_topic.arn
    depends_on = [ aws_sns_topic.sns_alarm_billing_topic ]
}


resource "aws_cloudwatch_metric_alarm" "cloudwatch_billing_alarm" {
    statistic = "Maximum"
    metric_name = "EstimatedCharges"
    alarm_name = "billing_alarm"
    comparison_operator = "GreaterThanOrEqualToThreshold"
    threshold = var.threshold
    evaluation_periods = 1
    period = 86400
    namespace = "AWS/Billing"
    datapoints_to_alarm = 1
    dimensions = {
      "Currency": "USD"
    }
    alarm_actions = [ aws_sns_topic.sns_alarm_billing_topic.arn ]
    depends_on = [ aws_sns_topic.sns_alarm_billing_topic, aws_sns_topic_subscription.sns_alarm_billing_sub ]
    
}



