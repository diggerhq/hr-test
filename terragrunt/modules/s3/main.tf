
terraform {
  backend "s3" {}
}

resource "null_resource" "test2_s3" {}

resource "null_resource" "test3_s3" {}

output "s3_name" {
  value = "val"
}
