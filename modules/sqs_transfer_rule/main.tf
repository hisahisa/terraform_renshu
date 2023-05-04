data "aws_caller_identity" "self" {}
data "aws_region" "self" {}

resource "aws_s3_bucket_notification" "bucket_notification" {
  for_each = toset(var.s3_bucket_names)
  bucket = each.key

  dynamic "queue" {
    for_each = var.sqs_queues
    content {
      queue_arn     = "arn:aws:sqs:${data.aws_region.self.name}:${data.aws_caller_identity.self.account_id}:${queue.value.arn}"
      events        = queue.value.events
      filter_prefix = queue.value.filter_prefix
      filter_suffix = queue.value.filter_suffix
    }
  }
}
