provider "google" {
    project = var.project
    credentials = "${file("terraform-gcp-391114-565919a79769.json")}"
    region = var.region
    # region = "us-east4"
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

resource "google_compute_instance" "app-01" {
  name         = "app-01"
  machine_type = var.instance_type
  # machine_type = "e2-small"
  zone = var.zone
  # zone = "us-east4-b"

  boot_disk {
    initialize_params {
      image = var.os
      # image = "ubuntu-os-cloud/ubuntu-2004-lts"
      size  = var.disk_size
      type  = "pd-standard"
    }
  }

  network_interface {
    network = "default"
    network_ip = "10.150.0.21"
    access_config {}
  }



metadata = {
    ssh-keys = var.keys
  }

  tags = ["http-server", "https-server"]
}

resource "google_compute_instance" "db-01" {
  name         = "db-01"
  machine_type = var.instance_type
  # machine_type = "e2-small"
  zone = var.zone
  # zone = "us-east4-b"

  boot_disk {
    initialize_params {
      image = var.os
      # image = "ubuntu-os-cloud/ubuntu-2004-lts"
      size  = var.disk_size
      type  = "pd-standard"
    }
  }

  network_interface {
    network = "default"
    network_ip = "10.150.0.22"
    access_config {}
  }



metadata = {
    ssh-keys = var.keys
  }

  tags = ["http-server", "https-server"]
}

resource "google_compute_instance" "control-node" {
  count        = 1
  name         = "control-node"
  machine_type = var.instance_type
  zone = var.zone

  boot_disk {
    initialize_params {
      image = var.os
      size  = var.disk_size
      type  = "pd-standard"
    }
  }

  network_interface {
    network = "default"
    network_ip = "10.150.0.20"
    access_config {}
  }


    connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("/home/ricardo/work-out/id_rsa")
    host        = self.network_interface[0].access_config[0].nat_ip
  }

provisioner "file" {
    source      = "/home/ricardo/automate/install.sh"
    destination = "/tmp/install.sh"
  }

  
provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/install.sh",
      "sudo bash /tmp/install.sh"
    ]
  }

  
  metadata = {
    ssh-keys = var.keys
  }

  tags = ["http-server", "https-server"]
}