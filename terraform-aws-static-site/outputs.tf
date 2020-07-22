# From /terraform-static-site-s3-bucket
output "domain_name" {
  value = aws_s3_bucket.b.website_endpoint
}


# From /terraform-static-site-s3-bucket-redirect

# From /terraform-static-site-cloudfront-distribution
