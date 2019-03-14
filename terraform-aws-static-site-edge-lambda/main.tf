provider "archive" {}

module "edge_lambda" {
  source      = "./modules/aws-edge-lambda"
  lambda_name = "${var.lambda_name}"
  project_src = "${var.project_src}"
  output_path = "${var.output_path}"
}

/**
 * TODO(jkirkpatrick24): This needs proper bare-apex redirect behaviour. Implement another
 * module that makes adding this trivial.
 */
module "s3-bucket" {
  source      = "../terraform-static-site-s3-bucket"
  bucket_name = "${var.bucket_name}"
}

module "cloudfront-distribution" {
  source      = "./modules/aws-cloudfront-distribution"
  domain_name = "${module.s3-bucket.domain_name}"
  origin_id   = "${var.origin_id}"
  aliases     = ["${var.sub_domain}.${var.site_domain}"]
  lambda_arn  = "${module.edge_lambda.lambda_arn}"
}
