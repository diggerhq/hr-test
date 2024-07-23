remote_state {
  backend = "s3"
  config = {
    bucket         = "hr-test-x"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "your-dynamodb-table"
  }
}