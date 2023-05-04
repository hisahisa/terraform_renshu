
module "s3_bucket_main" {
  source = "./modules/s3_bucket_rule"
  s3_bucket_names = var.s3_bucket_definition

  tags = {
    Name = "My Bucket"
    Role = "Dev"
  }

  s3_folders = [
    "folder1/aaa/",
    "folder1/bbb/",
    "folder1/ccc/",
    "folder2/aaa/",
    "folder2/bbb/"
  ]
}
