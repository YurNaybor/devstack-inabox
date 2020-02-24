## Version of core and plugins
terraform {
  required_version = ">= 0.11.0"
}
provider "openstack" {
	version = "1.13.0"
}
provider "null" {
	version = "1.0.0"
}

module "some-app" {
  source = "./modules/some-app"

  secgroup-name = "premium-secgroup"
  image-name = "ubuntu-16.04-server"
  zone-name = "example.com."
}
