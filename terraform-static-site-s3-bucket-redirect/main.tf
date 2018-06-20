provider "aws" {}

resource "aws_s3_bucket" "redirect-bucket" {
  bucket = "redirect-${var.bucket_name}"
  acl    = "public-read"

  website {
    redirect_all_requests_to = "https://${var.redirect_address}"
  }
}
