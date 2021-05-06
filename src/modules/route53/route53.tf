data "aws_route53_zone" "fundacionbd" {
  name         = "fundacionbd.xyz."
  private_zone = false
}

resource "aws_route53_record" "site" {
  zone_id = data.aws_route53_zone.fundacionbd.zone_id
  name    = "site.${data.aws_route53_zone.fundacionbd.name}"
  type    = "A"

  alias {
    name                   = var.cloudfront_dns
    zone_id                = var.cloudfront_zone_id
    evaluate_target_health = true
  }
}

resource "aws_acm_certificate" "frontend_cert" {
  domain_name       = "site.${data.aws_route53_zone.fundacionbd.name}"
  validation_method = "DNS"
}

resource "aws_route53_record" "frontend_validation_record" {
  for_each = {
    for dvo in aws_acm_certificate.frontend_cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.fundacionbd.zone_id
}

resource "aws_acm_certificate_validation" "frontend_validation" {
  certificate_arn         = aws_acm_certificate.frontend_cert.arn
  validation_record_fqdns = [for record in aws_route53_record.frontend_validation_record : record.fqdn]
}
####
resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.fundacionbd.zone_id
  name    = "www.${data.aws_route53_zone.fundacionbd.name}"
  type    = "A"

  alias {
    name                   = var.cloudfront_dns_prod
    zone_id                = var.cloudfront_zone_id_prod
    evaluate_target_health = true
  }
}

resource "aws_acm_certificate" "frontend_cert_prod" {
  domain_name       = "www.${data.aws_route53_zone.fundacionbd.name}"
  validation_method = "DNS"
}

resource "aws_route53_record" "frontend_validation_record_prod" {
  for_each = {
    for dvo in aws_acm_certificate.frontend_cert_prod.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.fundacionbd.zone_id
}

resource "aws_acm_certificate_validation" "frontend_validation_prod" {
  certificate_arn         = aws_acm_certificate.frontend_cert_prod.arn
  validation_record_fqdns = [for record in aws_route53_record.frontend_validation_record_prod : record.fqdn]
}