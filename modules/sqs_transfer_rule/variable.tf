
variable "s3_bucket_names" {
  type    = list(string)
  default = []
}

variable "sqs_queues" {
  type = map(object({
    arn           = string
    events        = list(string)
    filter_prefix = string
    filter_suffix = string
  }))
  default = {}
}
