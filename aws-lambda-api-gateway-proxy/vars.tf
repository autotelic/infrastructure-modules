variable "lambda_name" {
  description = "The name of the lambda"
}

variable "runtime" {
  default     = "nodejs6.10"
  description = "The lambda runtime"
}

variable "project_src" {
  description = "The source files location for the app"
}

variable "region" {
  default = "us-west-2"
}

variable "api_gateway_name" {
  description = "The name of the API gateway"
}

variable "output_path" {
  description = "The output location for the zip file"
}

variable "api_gateway_deployment_name" {
  description = "The name of the API gateway deployment"
}
