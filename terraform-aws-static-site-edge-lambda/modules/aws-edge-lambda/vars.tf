variable "lambda_name" {
  description = "The name of the lambda"
}

variable "project_src" {
  description = "The source files location for the app"
}

variable "output_path" {
  description = "The output location for the zip file"
}

variable "runtime" {
  description = "The runtime for the lambda"
  default     = "nodejs8.10"
}
