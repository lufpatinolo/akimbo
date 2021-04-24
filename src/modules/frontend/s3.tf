resource "aws_s3_bucket" "frontend-static-fbd" {
  bucket = "fundacion-bolivar-davivienda"
  acl    = "private"

  tags = {
    Name        = "Frontend FBD"
  }
}