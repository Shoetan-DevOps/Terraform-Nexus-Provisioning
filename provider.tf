terraform {
    required_version = "~> 1.2"
    required_providers {
        aws = {
            version = "~> 3.0"
            source = "hashicorp/aws"
        }
    }
}

provider "aws" {
    region = var.my-aws-region
}