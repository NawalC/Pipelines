terraform {
  required_version = "~> 1.2.0"

  backend "s3"{
   bucket = "tf-training-state-file-14072022"
    key = "main"
    region = "eu-west-2"
  }
}