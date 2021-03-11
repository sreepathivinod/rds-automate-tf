terraform {
  backend "s3" {
    bucket = "my-dev-tf-state"
    key    = "tf-state/rds-postgres-prod.tfstate"
    region = "us-east-2"
  }
}