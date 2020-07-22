# From /terraform-static-site-s3-bucket
output "domain_name" {
  value = aws_s3_bucket.b.website_endpoint
}

# From /terraform-static-site-s3-bucket-redirect
output "domain_name" {
  value = aws_s3_bucket.www-bucket.website_endpoint
}

# From /terraform-static-site-cloudfront-distribution
