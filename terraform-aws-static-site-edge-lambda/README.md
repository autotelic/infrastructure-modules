# Terraform configuration for static AWS sites

| Variable | Description | Default |
| --- | --- | --- |
| bucket_name | The name of the bucket | none |
| lambda_name | The name of the lambda function | none |
| output_path | The output location for the zip file | none |
| origin_id | The unique ID for the cloudfront distribution | none |
| project_src | The source files location for the app | none |
| site_domain | cNAME for the distribution | none |
| sub_domain | subdomain for the distribution | none |
| runtime | The runtime for the lambda | nodejs8.10 |
