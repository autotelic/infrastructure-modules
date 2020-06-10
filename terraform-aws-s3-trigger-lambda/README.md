# AWS-S3-TRIGGER-LAMBDA

This module is used to configure an AWS Lambda that will be triggered when an object
is written to an s3 bucket.

## Usage

### Variables

| Variable        | Description                                              | required | default |
| --------------- | -------------------------------------------------------- | -------- | ------- |
| bucket_id       | ID of the s3 bucket that triggers the lambda             | yes      | none    |
| bucket_arn      | arn of the s3 bucket that triggers the lambda            | yes      | none    |
| s3_prefix       | A prefix that s3 objects must have to trigger the lambda | no       | ""      |
| lambda_name     | Name of the lambda function                              | yes      | none    |
| runtime         | Lambda function runtime                                  | yes      | none    |
| project_src     | Directory that will be zipped to create the lambda       | yes      | none    |
| lambda_timeout  | Timeout for the lambda function (in seconds)             | no       | 3       |
| lambda_env_vars | A map of env vars to be added to the lambda              | no       | {}      |

### Outputs

| Output               | Description                                                             |
| -------------------- | ----------------------------------------------------------------------- |
| lambda_arn           | The Amazon Resource Name (ARN) identifying your Lambda Function         |
| lambda_iam_role_name | The name of the IAM role where IAM policies for the lambda are attached |
