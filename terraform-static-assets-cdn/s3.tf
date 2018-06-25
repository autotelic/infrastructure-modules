resource "aws_s3_bucket" "static_assets" {
  bucket = "${var.bucket_name}"
  acl    = "public-read"
  region = "${var.bucket_region}"

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

resource "aws_s3_bucket_policy" "static_assets" {
  bucket = "${aws_s3_bucket.static_assets.id}"
  policy = "${data.aws_iam_policy_document.static_assets.json}"
}
