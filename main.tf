terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 3.0"
      }
    }
}
  
  
provider "aws" {
    access_key ="AKIAWQEUDCIWYWARNR3Q"
    secret_key = "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"
    region = "us-east-1"
}
  

  
resource "aws_s3_bucket_object" "s3-web-wite" {
    bucket = filmevreni208
    acl = "public-read" #or can be public read
    key = "s3-web-wite.html"
    source = "./s3-web-wite.html"
}


resource "aws_s3_bucket" "filmevreni208" {
    bucket = "filmevreni208.terraform-tutorials.com"
    acl = "public-read"
    policy = file ("policy.json")
    website {
        index_document = "s3-web-wite.html"
    }
    tags = {
        Name = "soralxi filmleri"
        Environment = "MovieOceon"
    }
}

output "bucket_domain_name" {
    value = "aws_s3_bucket.filmevreni208.website_endpoint"
}