provider "google" {
    project = "terraform-gcp-391114"
    credentials = "${file("terraform-gcp-391114-565919a79769.json")}"
    region = "us-east4"
}


# resource "google_compute_firewall" "allow_http" {
#   name    = "allow-http"
#   network = "default"

#   allow {
#     protocol = "tcp"
#     ports    = ["80", "8080", "443"]
#   }
# }

# resource "google_compute_firewall" "allow_udp" {
#   name    = "allow-udp"
#   network = "default"

#   allow {
#     protocol = "udp"
#     ports    = ["0-65535"]
#   }
# }

resource "google_compute_instance" "k8s_instances" {
  count        = 3
  name         = "k8s-${count.index + 1}"
  machine_type = "e2-standard-2"
  zone = "us-east4-b"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
      size  = 10
      type  = "pd-standard"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }



metadata = {
    ssh-keys = ""
  }

  tags = ["http-server", "https-server"]
}

resource "google_compute_instance" "rancher_instance" {
  count        = 1
  name         = "rancher-srv"
  machine_type = "e2-standard-2"
  zone = "us-east4-b"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
      size  = 10
      type  = "pd-standard"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }



  metadata = {
    ssh-keys = ""
  }

  tags = ["http-server", "https-server"]
}