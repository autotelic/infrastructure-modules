# Currently AWS edge lambdas must be created in us-east-1.
provider "aws" {
  region = "us-east-1"
}

data "aws_caller_identity" "current" {}

data "archive_file" "lambda_zip" {
  type        = "zip"
  output_path = "${var.output_path}.zip"
  source_dir  = "${var.project_src}"
}

resource "aws_iam_role" "role" {
  name = "${var.lambda_name}_lambda_iam_policy"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": [
          "lambda.amazonaws.com",
          "edgelambda.amazonaws.com"
        ]
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_permission" "allow_cloudfront" {
  statement_id  = "AllowExecutionFromCloudfront"
  action        = "lambda:GetFunction"
  function_name = "${var.lambda_name}:${aws_lambda_function.lambda.version}"
  principal     = "events.amazonaws.com"
}

resource "aws_lambda_function" "lambda" {
  filename         = "${data.archive_file.lambda_zip.output_path}"
  function_name    = "${var.lambda_name}"
  role             = "${aws_iam_role.role.arn}"
  handler          = "index.handler"
  source_code_hash = "${data.archive_file.lambda_zip.output_base64sha256}"
  runtime          = "${var.runtime}"
  publish          = true
}
