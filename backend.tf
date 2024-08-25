# store the terraform state file in s3
terraform {
  backend "s3" {
    bucket = "your-terraform-state-bucket22"
    key    = "test-module.tfstate"
    region = "us-east-1"
#    profile   = 
  }
}