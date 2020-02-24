## Storing the Terraform state in OpenStack Swift
terraform {
  backend "swift" {
    container = "terraform-project-setup-state"
    archive_container = "terraform-project-setup-state-archive"
  }
}

data "terraform_remote_state" "state" {
  backend = "swift"
  config = {
    container = "terraform-project-setup-state"
    archive_container = "terraform-project-setup-state-archive"
  }
}

