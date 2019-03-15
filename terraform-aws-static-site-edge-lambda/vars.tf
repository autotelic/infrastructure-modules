variable "aws_region" {
  description = "The region the AWS resources will be deployed to"
  default     = "us-west-2"
}

variable "has_bare_apex_redirect" {
  description = "Enable redirect behavior from www to bare apex"
  default     = false
}

variable "lambda_name" {
  description = "The name of the lambda"
  default     = "test-lambda"
}

variable "project_src" {
  description = "The source files location for the app"
  default     = "lambda"
}

variable "output_path" {
  description = "The output location for the zip file"
  default     = "lambda"
}

variable "runtime" {
  description = "The runtime for the lambda"
  default     = "nodejs8.10"
}

variable "bucket_name" {
  description = "The name of the bucket"
  default     = "autotelic-b"
}

variable "origin_id" {
  description = "The unique ID for the cloudfront distribution"
  default     = "autotelic-b-d"
}

variable "site_aliases" {
  description = "aliases for the distribution"
  default     = []
  type        = "list"
}

variable "redirect_aliases" {
  description = "aliases for the redirect distribution"
  default     = []
  type        = "list"
}

variable "site_domain" {
  description = "cNAME for the distribution"
}
