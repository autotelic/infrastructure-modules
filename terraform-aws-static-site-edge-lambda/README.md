# Terraform configuration for static AWS sites

This module contains configuration for creating a static site hosted in an AWS S3 bucket
and a cloudfront distribution and an associated edge lambda.

# Using this module

This module requires the following variables:

| Variable | Description | Default |
| --- | --- | --- |
| bucket_name | The name of the bucket for the static site | none |
| lambda_name | The name of the edge lambda function | none |
| output_path | The output location for the zipped edge lambda file contents | none |
| origin_id | The unique ID for the cloudfront distribution | none |
| project_src | The source files directory location for the edge lambda source code | none |
| site_domain | cNAME for the cloudfront distribution | none |
| sub_domain | subdomain for the distribution | none |
| runtime | The runtime for the lambda | nodejs8.10 |

## Example

```hcl

provider "aws" {}

module "site-with-cdn-and-edge-lambda" {
  source = <MODULE LOCATION>
  lambda_name = "${var.lambda_name}"
  output_path = "${var.output_path}"
  origin_id   = "${var.origin_id}"
  project_src = "${var.project_src}"
  site_domain = "${var.site_domain}"
  sub_domain  = "${var.sub_domain}"
}
```
