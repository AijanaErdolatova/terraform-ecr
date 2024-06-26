terraform {
  backend "s3" {
    bucket = "ecr-tf-state-aijana"
    //dynamodb_table = "state_lock"
    key    = "tf-ecr"
    region = "us-east-1"
  }
}


provider "aws" {
  region = "us-east-1"
}

resource "aws_ecr_repository" "my_ecr_repo" {
  name                 = "my-ecr-repo12"
  image_tag_mutability = "IMMUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}
