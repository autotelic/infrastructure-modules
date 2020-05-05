# AWS-SES-S3-STORAGE

This module is used to configure an AWS SES service to receive emails from a specified
domain and store them in an s3 bucket.

## Usage

### DNS Provisioning

After using terraform to create the resources, you will need to provision the DNS
records to finish the configuration.

#### Validating the Domain

Create a `TXT` record for the domain using your DNS provider. The challenge details
will be located on the AWS SES console under the domain you are registering.

This module also provides the "aws_ses_domain_identity_verification_token" output,
which is the value of the `TXT` record.

The `TXT` record should have:

```
name: "_amazonses.<your domain>"
value: "<aws_ses_domain_identity_verification_token>"
```

Once completed, the verification "pending" status will be replaced with "verified".

#### Configuring the MX record

Next you will need to create an `MX` record to route all incoming mail traffic to the
aws SES server. Again, instructions are provided on the AWS console.

The name should be your domain (or subdomain) and the value is the location of the
server.

### Variables

| Variable                    | Description                                          | required | default |
| --------------------------- | ---------------------------------------------------- | -------- | ------- |
| bucket_name                 | name of the s3 bucket the raw emails will be stored  | yes      | none    |
| domain                      | the domain to registered for use with SES            | yes      | none    |
| recipients                  | list of recipients that the store action will run on | yes      | none    |
| s3_bucket_object_key_prefix | prefix the emails will be stored under               | no       | ""      |

### Outputs

| Output                                     | Description                                     |
| ------------------------------------------ | ----------------------------------------------- |
| bucket_id                                  | id of the email storage bucket                  |
| bucket_arn                                 | arn of the email storage bucket                 |
| aws_ses_active_rule_set_name               | name of the active rule set                     |
| aws_ses_domain_identity_verification_token | token required to validate the domain challenge |
