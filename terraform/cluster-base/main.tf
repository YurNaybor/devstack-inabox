## provide an image
resource "openstack_images_image_v2" "ubuntu1604" {
  name   = "ubuntu-16.04-server"
  #image_source_url = "https://cloud-images.ubuntu.com/releases/16.04/release-20180831/ubuntu-16.04-server-cloudimg-amd64-disk1.img"
  image_source_url = "https://cloud-images.ubuntu.com/releases/16.04/release/ubuntu-16.04-server-cloudimg-amd64-disk1.img"
  container_format = "bare"
  disk_format = "qcow2"
  min_disk_gb = "2"
  min_ram_mb = "512"

  # see https://docs.openstack.org/glance/rocky/admin/useful-image-properties.html
  properties = {
    architecture = "x86_64"
    os_distro = "ubuntu"
    os_version = "16.04"
    os_type = "linux"
    os_admin_user = "ubuntu"
  }
}
resource "openstack_images_image_v2" "ubuntu1804" {
  name   = "ubuntu-18.04-server"
  #image_source_url = "https://cloud-images.ubuntu.com/releases/18.04/release-20191205/ubuntu-18.04-server-cloudimg-amd64.img"
  image_source_url = "https://cloud-images.ubuntu.com/releases/18.04/release/ubuntu-18.04-server-cloudimg-amd64.img"
  container_format = "bare"
  disk_format = "qcow2"
  min_disk_gb = "2"
  min_ram_mb = "512"

  # see https://docs.openstack.org/glance/rocky/admin/useful-image-properties.html
  properties = {
    architecture = "x86_64"
    os_distro = "ubuntu"
    os_version = "18.04"
    os_type = "linux"
    os_admin_user = "ubuntu"
  }
}
