# Configure AWS provider
provider "aws" {
  region = "us-east-1"
  profile = "aws-icesi-2023"
  default_tags {
    tags = {
      Environment = "Lab"
      Name        = "EC2 Basico"
    }
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}