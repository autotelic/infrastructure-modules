
output "domain_name" {
  value = "${aws_s3_bucket.b.bucket_domain_name}"
}