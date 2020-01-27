provider "aws" {
}

resource "aws_s3_bucket" "www-bucket" {
  bucket = "www-${var.bucket_name}"
  acl    = "public-read"

  website {
    redirect_all_requests_to = "https://${var.redirect_address}"
  }
}

