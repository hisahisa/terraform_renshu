variable "sqs_names" {
  description = "sqs name"
  type        = list(string)
}

variable "s3_bucket_names" {
  type    = list(string)
  default = []
}

variable "s3_bucket_arns" {
  type    = list(string)
  default = []
}
