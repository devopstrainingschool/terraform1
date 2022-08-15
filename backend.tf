terraform {
  backend "s3" {
    bucket  = "terraform-remote-state-s31"
    key     = "terraform-remote-state-s31/terraform-infrastructure.tfstate"
    region  = "us-east-2"
   
  }
}