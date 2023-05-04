output "s3_bucket_names" {
  value = [for bucket in aws_s3_bucket.s3_event_bucket : bucket.id]
}

output "s3_bucket_arns" {
  value = [for bucket in aws_s3_bucket.s3_event_bucket : bucket.arn]
}
