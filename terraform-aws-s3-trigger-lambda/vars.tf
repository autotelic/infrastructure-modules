variable "bucket_id" {
  description = "ID of the s3 bucket that triggers the lambda"
}
variable "bucket_arn" {
  description = "arn of the s3 bucket that triggers the lambda"
}

variable "s3_prefix" {
  description = <<EOF
  A prefix that objects must have to trigger the lambda. Any object written with a different
  prefix will not invoke the lambda. Prefixes are treated like directories in s3 buckets.
  Defaults to the root of the bucket.
EOF
  default     = ""
}

variable "lambda_name" {
  description = "Name of the lambda function"
}

variable "runtime" {
  description = "Lambda function runtime"
}

variable "project_src" {
  description = "Directory that will be zipped to create the lambda"
}

variable "lambda_timeout" {
  description = "Timeout for the lambda function (in seconds)"
  default     = 3
}

variable "lambda_env_vars" {
  description = "Lambda environment variables"
  type        = map(string)
  default     = {}
}
