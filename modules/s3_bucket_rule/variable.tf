
variable "s3_bucket_names" {
  description = "s3 bucket names"
  type        = list(string)
}

variable "s3_folders" {
  description = "A list of folders passed to resources."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A map of tags (key-value pairs) passed to resources."
  type        = map(string)
  default     = {}
}
