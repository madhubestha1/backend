variable "aws_region" {
    type = string
    default = "us-east-1"
}

variable "terraform_s3_bucket" {
    type = string
    default = "msoft-tf"
}

variable "terraform_lock" {
    type = string
    default = "msoft-tf-lock"
}