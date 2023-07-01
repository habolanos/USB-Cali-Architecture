# Set Driver to Cloud
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure AWS provider
provider "aws" {
  region = "us-east-1"
  profile = "usb-cali"
  default_tags {
    tags = {
      Environment = "Lab"
    }
  }
}