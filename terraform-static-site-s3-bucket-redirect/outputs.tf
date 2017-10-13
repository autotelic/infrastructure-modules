output "domain_name" {
  value = "${aws_s3_bucket.www-bucket.website_endpoint}"
}