variable "bucket_name" {
  description = "The name of the S3 bucket"
}

variable "redirect_address" {
  description = "The address to redirect requests to"
}

variable "origin_id" {
  description = "The unique ID for the cloudfront distribution"
}

variable "domain_name" {
  description = "The domain name for the cloudfront distribution"
}

variable "aliases" {
  description = "cNAMEs for the distribution"
  type        = list(string)
}

variable "www_origin_id" {
  description = "The unique ID for the cloudfront distribution"
}

variable "www_domain_name" {
  description = "The domain name for the cloudfront distribution"
}

variable "www_aliases" {
  description = "cNAMEs for the distribution"
  type        = list(string)
}
