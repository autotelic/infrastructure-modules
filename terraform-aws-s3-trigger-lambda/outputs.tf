output "lambda_arn" {
  description = "The Amazon Resource Name (ARN) identifying your Lambda Function"
  value       = aws_lambda_function.func.arn
}

output "lambda_iam_role_name" {
  description = "The name of the IAM role where IAM policies for the lambda are attached"
  value       = aws_iam_role.iam_for_lambda.name
}
