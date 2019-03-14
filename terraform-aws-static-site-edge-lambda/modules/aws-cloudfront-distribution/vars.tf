variable "aliases" {
  description = "cNAMEs for the distribution"
  type        = "list"
}

variable "domain_name" {
  description = "The domain name for the cloudfront distribution"
}

variable "lambda_arn" {
  description = "arn for the lambda"
}

variable "origin_id" {
  description = "The unique ID for the cloudfront distribution"
}
