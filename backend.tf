terraform {
  backend "s3" {
    bucket = "bucket-025584964672"
    key    = "terraform.tfstate"
    region = "us-east-1"
    #dynamodb_table = "dynamodb"
  }
}