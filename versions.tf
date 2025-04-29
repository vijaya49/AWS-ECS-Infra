terraform {
  required_version = ">= 1.10.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "my-reception-memories"
    key    = "vpc/dev/terraform.tfstate" 
    region = "us-east-1"
    encrypt = true
    use_lockfile = true 
  }
}
######## assume role method testing ########
provider "aws" {
  region     = "us-east-1"
}