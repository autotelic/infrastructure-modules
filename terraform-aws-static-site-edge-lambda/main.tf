provider "archive" {}

module "edge_lambda" {
  source      = "./modules/aws-edge-lambda"
  lambda_name = "${var.lambda_name}"
  project_src = "${var.project_src}"
  output_path = "${var.output_path}"
}

module "s3-bucket" {
  source      = "../terraform-static-site-s3-bucket"
  bucket_name = "${var.bucket_name}"
}

module "cloudfront-distribution" {
  source      = "./modules/aws-cloudfront-distribution"
  domain_name = "${module.s3-bucket.domain_name}"
  origin_id   = "${var.origin_id}"
  lambda_arn  = "${module.edge_lambda.lambda_arn}"
  aliases     = "${var.site_aliases}"
}

resource "aws_s3_bucket" "www-bucket" {
  count  = "${var.has_bare_apex_redirect}"
  bucket = "www-${var.bucket_name}"
  acl    = "public-read"

  website {
    redirect_all_requests_to = "https://${var.site_domain}"
  }
}

module "redirect-cloudfront-distribution" {
  source                 = "./modules/aws-cloudfront-distribution"
  domain_name            = "${aws_s3_bucket.www-bucket.website_endpoint}"
  origin_id              = "${var.origin_id}"
  should_create_resource = "${var.has_bare_apex_redirect}"
  aliases                = "${var.redirect_aliases}"
  lambda_arn             = "${module.edge_lambda.lambda_arn}"
}
