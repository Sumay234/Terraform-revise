# main.tf

provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "creating_s3" {
  bucket = var.creating_s3
  acl    = var.acl

  versioning {
    enabled = var.versioning
  }

  tags = {
    Name        = var.tags_name
    Environment = var.environment
  }
}


output "bucket_name" {
  value = aws_s3_bucket.creating_s3.bucket
}

output "arn" {
  value = aws_s3_bucket.creating_s3.arn
}

output "id" {
  value = aws_s3_bucket.creating_s3.id
}