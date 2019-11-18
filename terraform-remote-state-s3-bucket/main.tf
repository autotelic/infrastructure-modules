provider "aws" {}

resource "aws_s3_bucket" "state_bucket" {

  bucket = var.bucket_name

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

}

resource "aws_s3_bucket_public_access_block" "remote_state_storage_storage_access_rules" {
  bucket = aws_s3_bucket.state_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
