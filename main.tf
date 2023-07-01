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
      size  = 20
      type  = "pd-standard"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }



metadata = {
    ssh-keys = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC8cu4J6FGU60cAPXuN5IRB2DkowzCE0p7yeOhy/IvdBIjEOuJEsjEkqL6ZoDQV7c74/WIDKrZnuZi/s1Lupm9+wgEFkvlA4OCDa3xJW5lmBc0BxabQpGL+iLuKlEYxUBPPAJc0NSIoMIbgWkbf8qdoDOrmhUgYEYkgzyzoxy8kqkVvu9B/YpqNDz09cw656rdp/DO9owAcUkLm+28v0LGuRib1eI5sD4SPqWwBsuSaMpzdNwPRNKosB9sYhr1gAlYxvs8wwH5faSoYBWASacgkgyLLuGresSm1AWQRJ+YOo+DbZVfgmHAGiMlYR149e8Hh9ty+ExTiRY+wAGz8IcdXlKkwOEuWDAjvYkC+euNIP93e851NkElzHF1t14FR3hxWGvlX+U5JDyWTC8QY7VPqzjBxHruxKr3fD+Ats8LWKvxuODBeIhtaF2oTvFI1WB9icB1kQxZe8h0Audn1oA9ZO+tMmd0GEkuVr8dT5QNs8O5uzYNFafiW9xBKf5YgM+s= ubuntu"
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
      size  = 30
      type  = "pd-standard"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  


  metadata = {
    ssh-keys = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC8cu4J6FGU60cAPXuN5IRB2DkowzCE0p7yeOhy/IvdBIjEOuJEsjEkqL6ZoDQV7c74/WIDKrZnuZi/s1Lupm9+wgEFkvlA4OCDa3xJW5lmBc0BxabQpGL+iLuKlEYxUBPPAJc0NSIoMIbgWkbf8qdoDOrmhUgYEYkgzyzoxy8kqkVvu9B/YpqNDz09cw656rdp/DO9owAcUkLm+28v0LGuRib1eI5sD4SPqWwBsuSaMpzdNwPRNKosB9sYhr1gAlYxvs8wwH5faSoYBWASacgkgyLLuGresSm1AWQRJ+YOo+DbZVfgmHAGiMlYR149e8Hh9ty+ExTiRY+wAGz8IcdXlKkwOEuWDAjvYkC+euNIP93e851NkElzHF1t14FR3hxWGvlX+U5JDyWTC8QY7VPqzjBxHruxKr3fD+Ats8LWKvxuODBeIhtaF2oTvFI1WB9icB1kQxZe8h0Audn1oA9ZO+tMmd0GEkuVr8dT5QNs8O5uzYNFafiW9xBKf5YgM+s= ubuntu"
  }

  tags = ["http-server", "https-server"]
}