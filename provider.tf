terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 5.0"
        }
    }
}

provider "aws" {
    region = "us-east-1"    
  
}

terraform {
  backend "s3" {
    bucket = "flaskapp-sec2"
    key    = "flaskappsec2/tfstate"
    region = "us-east-1"
    encrypt = true
  }
}