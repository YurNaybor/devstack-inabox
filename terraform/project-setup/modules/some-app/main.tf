## retrieve existing zone
data "openstack_dns_zone_v2" "zone" {
  name = "${var.zone-name}"
}


## a keypair to access the instance
resource "openstack_compute_keypair_v2" "key" {
  name       = "mykeypair"
  public_key = "${file("ssh.key.pub")}"
}

## floating ip for external access
resource "openstack_networking_floatingip_v2" "fip" {
  pool = "public"
}

## the instance itself
resource "openstack_compute_instance_v2" "instance" {
  name            = "myinstance"
  image_name      = "${var.image-name}"
  flavor_name     = "ds512M"
  key_pair        = "${openstack_compute_keypair_v2.key.name}"
  # this might not be needed for some clusters
  security_groups = ["default", "${var.secgroup-name}"]

  network {
    name = "private"
  }
}

## associate the floating ip to the instance
resource "openstack_compute_floatingip_associate_v2" "terraform" {
  floating_ip = "${openstack_networking_floatingip_v2.fip.address}"
  instance_id = "${openstack_compute_instance_v2.instance.id}"
}

## user friendly name
resource "openstack_dns_recordset_v2" "dtp_recordset" {
  zone_id = "${data.openstack_dns_zone_v2.zone.id}"
  name = "dtp.${var.zone-name}" # domain needs to be here
  description = "An example record set"
  ttl = 3000
  type = "A"
  records = ["${openstack_compute_floatingip_associate_v2.terraform.floating_ip}"]
}

## provision the instance
resource "null_resource" "provisioner" {
        connection {
                type = "ssh"
                user = "ubuntu"
                private_key = "${file("ssh.key")}"
                host = "${openstack_compute_floatingip_associate_v2.terraform.floating_ip}"
        }

        provisioner "remote-exec" {
                inline = [
                        "sudo apt-get update",
                        "sudo apt-get -y install nginx"
                ]

        }
}
