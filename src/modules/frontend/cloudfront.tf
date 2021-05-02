locals {
  s3_origin_id = "s3-fbd-Origin"
}
resource "aws_cloudfront_origin_access_identity" "s3_fbd_origin_access_identity" {
  comment = "access-identity-fbd"
}

resource "aws_cloudfront_distribution" "frontend_distribution" {
  origin {
    domain_name = aws_s3_bucket.frontend-static-fbd.bucket_regional_domain_name
    origin_id   = local.s3_origin_id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.s3_fbd_origin_access_identity.cloudfront_access_identity_path
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Frontend Fundacion Bolivar Davivienda"
  default_root_object = "index.html"

  aliases = ["site.fundacionbd.xyz"]

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  price_class = "PriceClass_All"

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = ["US", "CO"]
    }
  }

  

  tags = {
    Name = "FBD"
  }

  viewer_certificate {
    cloudfront_default_certificate = false
    acm_certificate_arn = var.arn_certificate
    ssl_support_method = "sni-only"
    minimum_protocol_version = "TLSv1.2_2019"
  }
}