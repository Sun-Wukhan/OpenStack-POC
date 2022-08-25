terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.42.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
}

# Configure the OpenStack Provider
provider "openstack" {}

resource "openstack_compute_instance_v2" "UAT_ANS_DB" {
  name            = "Big-${var.env}-Bad-Wolf"
  image_id        = ""
  flavor_name     = ""
  key_pair        = ""
  security_groups = ["default"]

  network {
    name = ""
  }
}

resource "openstack_compute_volume_attach_v2" "attached" {
  instance_id = "${openstack_compute_instance_v2.myinstance.id}"
  volume_id   = "${openstack_blockstorage_volume_v2.myvol.id}"
}

resource "openstack_blockstorage_volume_v2" "myvol" {
  name = "myvol"
  size = 250
}


