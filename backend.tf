terraform {
  backend "s3" {
    bucket  = "terraform-remote-state-s3"
    key     = "terraform-infrastructure.tfstate"
    region  = "us-east-2"
    encrypt = "true"
    dynamodb_table = "hands-on-cloud-terraform-remote-state-dynamodb"
  }
}