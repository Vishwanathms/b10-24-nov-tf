provider "aws" {
  region = "us-east-1"
  profile = "dl-eks-01"
}

provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.88.0"
    }

    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.17.0"
    }
  }
}
