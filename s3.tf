resource "aws_s3_bucket" "bucket" {
  bucket = local.s3_sufix
}
