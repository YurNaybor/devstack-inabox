## Storing the Terraform state in OpenStack Swift
terraform {
  required_version = ">= 0.12.18"
  backend "swift" {
    container = "terraform-cluster-base-state"
    archive_container = "terraform-cluster-base-state-archive"
  }
}
provider "openstack" {
	version = "1.24.0"
}
provider "null" {
	version = "2.1.2"
}

