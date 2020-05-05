resource "aws_s3_bucket" "reports_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_public_access_block" "reports_bucket_storage_storage_access_rules" {
  bucket = aws_s3_bucket.reports_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "reports_bucket_policy" {
  bucket = aws_s3_bucket.reports_bucket.id
  policy = data.aws_iam_policy_document.ses_write_to_s3.json
  depends_on = [
    aws_s3_bucket.reports_bucket,
    aws_s3_bucket_public_access_block.reports_bucket_storage_storage_access_rules
  ]
}

data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "ses_write_to_s3" {
  statement {
    sid = "AllowSESPuts"

    actions = ["s3:PutObject"]

    principals {
      type        = "Service"
      identifiers = ["ses.amazonaws.com"]
    }

    resources = ["arn:aws:s3:::${var.bucket_name}/*"]

    condition {
      test     = "StringEquals"
      variable = "aws:Referer"
      values   = [data.aws_caller_identity.current.account_id]
    }
  }
}

resource "aws_ses_domain_identity" "primary_domain" {
  domain = var.domain
}

resource "aws_ses_receipt_rule_set" "store" {
  rule_set_name = "store_receive_all"
}

resource "aws_ses_active_receipt_rule_set" "store" {
  rule_set_name = aws_ses_receipt_rule_set.store.rule_set_name
  depends_on = [
    aws_ses_receipt_rule.store
  ]
}

resource "aws_ses_receipt_rule" "store" {
  name          = "store"
  rule_set_name = aws_ses_receipt_rule_set.store.rule_set_name
  recipients    = var.recipients
  enabled       = true
  scan_enabled  = true

  s3_action {
    position          = 1
    bucket_name       = var.bucket_name
    object_key_prefix = var.s3_bucket_object_key_prefix
  }

  depends_on = [
    aws_s3_bucket.reports_bucket,
    aws_s3_bucket_policy.reports_bucket_policy,
  ]
}
