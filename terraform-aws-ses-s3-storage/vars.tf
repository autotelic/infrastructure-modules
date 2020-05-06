variable "bucket_name" {
  description = "the name of the s3 bucket the raw emails will be stored"
}

variable "domain" {
  description = "the domain to registered for use with SES"
}

variable "recipients" {
  type        = list(string)
  description = "list of recipients that the store action will run on"
}

variable "s3_bucket_object_key_prefix" {
  description = "The prefix (path) the raw emails will be stored in the bucket"
  default     = ""
}
