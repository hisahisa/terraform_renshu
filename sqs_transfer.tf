
module "sqs_transfer" {
  source = "./modules/sqs_transfer_rule"
  s3_bucket_names = var.s3_bucket_definition

  sqs_queues = {
    queue1 = {
      arn           = "sqs-test-event2"
      events        = ["s3:ObjectCreated:Put"]
      filter_prefix = "folder1/aaa/"
      filter_suffix = ".tsv"
    },
    queue2 = {
      arn           = "sqs-test-event2"
      events        = ["s3:ObjectCreated:Put"]
      filter_prefix = "folder1/aaa/"
      filter_suffix = ".csv"
    },
    queue3 = {
      arn           = "sqs-test-event2"
      events        = ["s3:ObjectCreated:Put"]
      filter_prefix = "folder1/aaa/"
      filter_suffix = ".xlsx"
    },
    queue4 = {
      arn           = "sqs-test-dwh2"
      events        = ["s3:ObjectCreated:Put"]
      filter_prefix = "folder2/aaa/"
      filter_suffix = ".tsv"
    }
    queue5 = {
      arn           = "sqs-test-dwh2"
      events        = ["s3:ObjectCreated:Put"]
      filter_prefix = "folder2/aaa/"
      filter_suffix = ".csv"
    },
  }
  depends_on = [module.sqs_first_converter] # module.sqs_first_converterに依存
}
