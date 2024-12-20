terraform {
  backend "s3" {
    bucket         = "tfstate-san-bucket"
    key            = "terraform/state/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf-locks"
  }
}
