provider "aws" {
}

# From /terraform-static-site-s3-bucket
resource "aws_s3_bucket" "b" {
  bucket = var.bucket_name
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}

data "aws_iam_policy_document" "b" {
  statement {
    sid    = "PublicReadGetObject"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions   = ["s3:GetObject"]
    resources = ["arn:aws:s3:::${var.bucket_name}/*"]
  }
}

resource "aws_s3_bucket_policy" "b" {
  bucket = aws_s3_bucket.b.id
  policy = data.aws_iam_policy_document.b.json
}

# From /terraform-static-site-s3-bucket-redirect

resource "aws_s3_bucket" "www-bucket" {
  bucket = "www-${var.bucket_name}"
  acl    = "public-read"

  website {
    redirect_all_requests_to = "https://${var.redirect_address}"
  }
}



