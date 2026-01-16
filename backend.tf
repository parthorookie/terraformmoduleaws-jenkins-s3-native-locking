terraform {
  backend "s3" {
    bucket       = "my-terraform-state-bucket-module-jenkins"
    key          = "terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}