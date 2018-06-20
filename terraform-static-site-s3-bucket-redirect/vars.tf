variable "region" {
  description = "The region for the asset"
  default     = "us-west-2"
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
}

variable "redirect_address" {
  description = "The address to redirect requests to"
}
