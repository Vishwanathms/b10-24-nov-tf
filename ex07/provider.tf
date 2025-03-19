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
    bucket = "vishwa250226"
    key = "backend.tfstate"
    region = "us-east-2"
    encrypt = true
    #dynamodb_table = "terraform-locks"
  }
}