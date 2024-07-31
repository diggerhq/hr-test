terraform {
  source = "../../modules/policies"
}

locals {
  emails = ["john.doe@hardrockdigital.com"]
}

include "root" {
  path = find_in_parent_folders()
}

include "account" {
  path   = find_in_parent_folders("account.hcl")
  expose = true
}

include "projects" {
  path   = find_in_parent_folders("projects.hcl")
  expose = true
}

dependency "dependencytest" {
  config_path = "${include.projects.locals.infrastructure_project_dir}/dependency"
}

inputs = {
  policy_name  = basename(get_terragrunt_dir())
#   account_id   = dependency.account.outputs.id
  description  = "Test Team access2"
  precedence   = 10
  match_emails = local.emails
  vpc_id = dependency.dependencytest.outputs.s3_name
}
