terraform {
  backend "s3" {
    dynamodb_table = "terraform-tfstate-lock"
    bucket         = "731812883207-terraform-tfstate"
    key            = "dev/terraform.tfstate"
    region         = "eu-west-2"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.29.1"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}