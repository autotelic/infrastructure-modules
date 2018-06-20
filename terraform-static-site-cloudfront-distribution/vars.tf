variable "origin_id" {
  description = "The unique ID for the cloudfront distribution"
}

variable "domain_name" {
  description = "The domain name for the cloudfront distribution"
}

variable "aliases" {
  description = "cNAMEs for the distribution"
  type        = "list"
}
