provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "cmcst_static_page" {
  bucket = "cmcst-static-page"
}

resource "aws_s3_bucket_policy" "cmcst_static_page_policy" {
  bucket = aws_s3_bucket.cmcst_static_page.id
  policy = data.aws_iam_policy_document.cmcst_static_page_policy.json
}

data "aws_iam_policy_document" "cmcst_static_page_policy" {
  statement {

    sid = "PublicReadGetObject"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject"
    ]

    resources = [
      "${aws_s3_bucket.cmcst_static_page.arn}/*",
    ]
  }
}

resource "aws_s3_bucket_ownership_controls" "cmcst_static_page_oc" {
  bucket = aws_s3_bucket.cmcst_static_page.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "cmcst_static_page_ab" {
  bucket = aws_s3_bucket.cmcst_static_page.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "cmcst_static_page_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.cmcst_static_page_oc,
  aws_s3_bucket_public_access_block.cmcst_static_page_ab, ]

  bucket = aws_s3_bucket.cmcst_static_page.id
  acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "web_page" {
  bucket = aws_s3_bucket.cmcst_static_page.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.cmcst_static_page.bucket
  key    = "index.html"
  source = "html/index.html"
  content_type = "text/html"
  etag   = filemd5("html/index.html")
}
