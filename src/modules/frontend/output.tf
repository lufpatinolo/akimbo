output "cloudfront_dns" {
  value = aws_cloudfront_distribution.frontend_distribution.domain_name
}

output "cloudfront_zone_id" {
  value = aws_cloudfront_distribution.frontend_distribution.hosted_zone_id
}

output "cloudfront_dns_prod" {
  value = aws_cloudfront_distribution.frontend_distribution_prod.domain_name
}

output "cloudfront_zone_id_prod" {
  value = aws_cloudfront_distribution.frontend_distribution_prod.hosted_zone_id
}