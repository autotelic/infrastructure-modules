provider "aws" {
}

provider "archive" {
}

data "aws_caller_identity" "current" {
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  output_path = "${var.lambda_name}.zip"
  source_dir  = var.project_src
}

