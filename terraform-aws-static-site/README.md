# AWS-Static-Site-Module
This module is used to configure a static site with aws,including two s3 buckets and two cloudfront distributions.

## Usage
### Variables
| Variable         | Description                                           | Required? | Default |
| ---------------- | :---------------------------------------------------- | :-------: | :-----: |
| bucket_name      | The name of the S3 bucket                             | Yes       | None    |
| redirect_address | The address to redirect requests to                   | Yes       | None    |
| origin_id        | The unique ID for the non-www cloudfront distribution | Yes       | None    |
| aliases          | cNAMEs for the non-www cloudfront distribution        | Yes       | None    |
| www_origin_id    | The unique ID for the www cloudfront distribution     | Yes       | None    |
| www_aliases      | cNAMEs for the www cloudfront distribution            | Yes       | None    |
| acm_arn          | The ARN of the certificate                            | Yes       | None    |