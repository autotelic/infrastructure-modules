provider "aws" {}

data "aws_iam_policy_document" "static_assets" {
  statement = {
    sid    = "PublicReadGetObject"
    effect = "Allow"

    principals = {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions   = ["s3:GetObject"]
    resources = ["arn:aws:s3:::${var.bucket_name}/*"]
  }

  statement = {
    sid    = "StaticAssetAdmin"
    effect = "Allow"

    principals = {
      type        = "AWS"
      identifiers = ["${var.admin_user_arn}"]
    }

    actions   = ["s3:PutObject", "s3:PutObjectTagging"]
    resources = ["arn:aws:s3:::${var.bucket_name}/*"]
  }
}
