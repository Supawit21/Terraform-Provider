# ---------------------- Terraform provider -------------------------------
terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
}


# ---------------------- region for provisioning ---------------------------
provider "aws" {
    region = "ap-southeast-1"
    alias = "singapore"
}