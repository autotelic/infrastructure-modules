output "cloudfront_id" {
  value = aws_cloudfront_distribution.s3_distribution.id
}

output "cloudfront_arn" {
  value = aws_cloudfront_distribution.s3_distribution.arn
}

output "cloudfront_status" {
  value = aws_cloudfront_distribution.s3_distribution.status
}

output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.s3_distribution.domain_name
}

output "bucket_id" {
  value = aws_s3_bucket.b.id
}

output "bucket_arn" {
  value = aws_s3_bucket.b.arn
}

output "bucket_bucket_domain_name" {
  value = aws_s3_bucket.b.bucket_domain_name
}

output "bucket_bucket_regional_domain_name" {
  value = aws_s3_bucket.b.bucket_regional_domain_name
}
