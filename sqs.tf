
module "sqs_first_converter" {
  source = "./modules/sqs_rule"
  sqs_names = var.sqs_name_definition

  s3_bucket_names = module.s3_bucket_main.s3_bucket_names
  s3_bucket_arns = module.s3_bucket_main.s3_bucket_arns
}
