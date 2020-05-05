output "bucket_id" {
  value = aws_s3_bucket.reports_bucket.id
}

output "bucket_arn" {
  value = aws_s3_bucket.reports_bucket.arn
}

output "aws_ses_active_rule_set_name" {
  value = aws_ses_receipt_rule_set.store.rule_set_name
}

output "aws_ses_domain_identity_verification_token" {
  value = aws_ses_domain_identity.primary_domain.verification_token
}
