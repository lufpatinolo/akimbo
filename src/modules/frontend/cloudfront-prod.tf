locals {
  s3_origin_id_prod = "s3-fbd-Origin-prod"
}
resource "aws_cloudfront_origin_access_identity" "s3_fbd_origin_access_identity_prod" {
  comment = "access-identity-fbd-prod"
}

resource "aws_cloudfront_distribution" "frontend_distribution_prod" {
  origin {
    domain_name = aws_s3_bucket.frontend-static-fbd-prod.bucket_regional_domain_name
    origin_id   = local.s3_origin_id_prod

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.s3_fbd_origin_access_identity_prod.cloudfront_access_identity_path
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Frontend Fundacion Bolivar Davivienda Prod"
  default_root_object = "index.html"

  aliases = ["www.fundacionbolivardavivienda.org", "fundacionbolivardavivienda.org"]

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id_prod

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"

    lambda_function_association {
      event_type   = "origin-response"
      lambda_arn   = aws_lambda_function.lambda_edge_scHeaders.qualified_arn
      include_body = false
    }

    lambda_function_association {
      event_type   = "origin-request"
      lambda_arn   = aws_lambda_function.lambda_edge_index.qualified_arn
      include_body = true
    }

    min_ttl                = 0
    default_ttl            = 0
    max_ttl                = 0
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
    acm_certificate_arn = "arn:aws:acm:us-east-1:735065655809:certificate/65e454fe-70a6-4d66-aec7-cb0982d77182"
    ssl_support_method = "sni-only"
    minimum_protocol_version = "TLSv1.2_2019"
  }
}