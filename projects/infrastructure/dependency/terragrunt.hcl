
terraform {
  source = "../../../terragrunt/modules/s3"
}

include "root" {
  path = find_in_parent_folders("terragrunt.hcl")
}


inputs = {
  description  = "Test test"
}