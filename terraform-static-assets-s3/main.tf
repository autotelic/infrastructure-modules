provider "aws" {}

resource "aws_s3_bucket" "b" {
  bucket = "${var.bucket_name}"
  acl    = "public-read"
  region = "ap-southeast-2"

  lifecycle_rule {
    id      = "OldAssets"
    enabled = true

    prefix = "${var.prefix}"

    tags {
      "age" = "old"
    }

    expiration {
      days = "${var.time_to_live}"
    }
  }
}

data "aws_iam_policy_document" "b" {
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

resource "aws_s3_bucket_policy" "b" {
  bucket = "${aws_s3_bucket.b.id}"
  policy = "${data.aws_iam_policy_document.b.json}"
}
