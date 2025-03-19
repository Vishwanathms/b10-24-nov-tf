provider "aws" {
  region = "us-east-1"
  profile = "default"
}


terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.88.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "vishwa11032025"
    key = "ex06/backend.tfstate"
    region = "us-east-1"
    encrypt = true
    #dynamodb_table = "terraform-locks"
  }
}