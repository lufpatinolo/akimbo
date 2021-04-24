resource "aws_s3_bucket" "frontend-static-fbd" {
  bucket = "fundacion-bolivar-davivienda"
  acl    = "private"
  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "aws_s3_bucket_public_access_block" "s3-fbd-block" {
    bucket                  = aws_s3_bucket.frontend-static-fbd.id
    ignore_public_acls      = true
    block_public_policy     = true
    block_public_acls       = true
    restrict_public_buckets = true
    
}

resource "aws_s3_bucket_policy" "s3-fbd-policy" {
  bucket = aws_s3_bucket.frontend-static-fbd.id
  policy = jsonencode({
    "Version": "2008-10-17",
    "Id": "PolicyForCloudFrontPrivateContent",
    "Statement": [
        {
            "Sid": "1",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity E1HZOUXL966CW8"
            },
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::fundacion-bolivar-davivienda/*"
        }
    ]
})
}