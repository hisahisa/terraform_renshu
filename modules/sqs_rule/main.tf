
locals {
  sqs_queues = distinct(flatten([
    for sqs in var.sqs_names : [
      for bucket_arn in var.s3_bucket_arns : {
        sqs_name    = "${sqs}-${terraform.workspace}"
        bucket_arn = bucket_arn
      }
    ]
  ]))
}

resource "aws_sqs_queue" "sqs_queues" {
  for_each      = {
      for entry in local.sqs_queues: "${entry.sqs_name}.${entry.bucket_arn}" => entry
  }
  name = each.value.sqs_name

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        Effect: "Allow",
        Principal: {
          "Service": "s3.amazonaws.com"
        },
        Action: "sqs:SendMessage",
        Resource: "arn:aws:sqs:*:*:${each.value.sqs_name}",
        Condition: {
          "ArnEquals": {
            "aws:SourceArn": var.s3_bucket_arns
          }
        }
      }
    ]
  })
}
