output "domain_name" {
  value = "${aws_s3_bucket.b.website_endpoint}"
}