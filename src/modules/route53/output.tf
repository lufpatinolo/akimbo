output "arn_certificate" {
  value = aws_acm_certificate.frontend_cert.arn
}

output "arn_certificate_prod" {
  value = aws_acm_certificate.frontend_cert_prod.arn
}