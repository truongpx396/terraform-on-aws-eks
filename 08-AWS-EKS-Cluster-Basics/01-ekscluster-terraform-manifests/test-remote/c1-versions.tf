# Terraform Settings Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version = "~> 3.70"
      version = ">= 4.65"
     }
    helm = {
      source = "hashicorp/helm"
      #version = "2.4.1"
      #version = "~> 2.4"
      version = "~> 2.9"
    }
    http = {
      source = "hashicorp/http"
      #version = "2.1.0"
      #version = "~> 2.1"
      version = "~> 3.3"
    }
  }

   backend "s3" {
    bucket = "magiclab396-terraform-on-aws-eks"
    key    = "dev/nginx-storage/terraform.tfstate"
    region = "ap-southeast-1" 

    # For State Locking
    dynamodb_table = "dev-nginx-storage"    
  }  
  
}

# Terraform AWS Provider Block
provider "aws" {
  region = "ap-southeast-1"
}

# Terraform HTTP Provider Block
provider "http" {
  # Configuration options
}