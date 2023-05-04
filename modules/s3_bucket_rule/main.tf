
locals {
  schema_privileges = distinct(flatten([
    for bucket in var.s3_bucket_names : [
      for folder in var.s3_folders : {
        bucket    = bucket
        folder = folder
      }
    ]
  ]))
}

resource "aws_s3_bucket" "s3_event_bucket" {
  for_each         = toset(var.s3_bucket_names)
  bucket        = each.key
  tags = var.tags
}

resource "aws_s3_object" "s3_folders" {
  for_each      = {
      for entry in local.schema_privileges: "${entry.bucket}.${entry.folder}" => entry
  }
  bucket = each.value.bucket
  key    = each.value.folder
  depends_on = [aws_s3_bucket.s3_event_bucket] # s3_event_bucketに依存
}
