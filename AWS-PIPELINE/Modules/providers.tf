terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
  alias  = "eu-west-2"
}

provider "aws" {
  region = "eu-west-1"
  alias  = "eu-west-1"
}