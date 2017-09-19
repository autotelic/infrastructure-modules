resource "aws_s3_bucket" "b" {
  bucket = "${var.bucket_name}"
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}