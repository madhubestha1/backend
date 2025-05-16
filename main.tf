provider "aws" {
    region = var.aws_region  
}

resource "aws_s3_bucket" "tf_bucket" {
    bucket = var.terraform_s3_bucket
    lifecycle {
      prevent_destroy = true
    }
}

resource "aws_s3_bucket_versioning" "aws_s3_bucket_versioning" {
  bucket = aws_s3_bucket.tf_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform_lock" {
  name = var.terraform_lock
  hash_key = "LockID"
  read_capacity = 5
  write_capacity = 5
  lifecycle {
    prevent_destroy = true
  }
  attribute {
    name = "LockID"
    type = "S"
  }
    tags = {
        "Name" = "DynamoDB Terraform State Lock Table"
    }
}