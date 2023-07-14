provider "google" {
    project = var.project
    credentials = "${file("key.json")}"
    region = var.region
    # region = "us-east4"
}



resource "google_compute_instance" "sonar-cube" {
  count        = 1
  name         = "sonar-cube"
  machine_type = var.instance_type
  zone = var.zone

  boot_disk {
    initialize_params {
      image = var.os
      size  = var.disk_size
      type  = "pd-standard"
    }
  }

  labels = {
    goog-ec-src = "vm_add-tf"
    name        = "sonar"
    type        = "server"
  }


  network_interface {
    network = "default"
    network_ip = "10.150.0.39"
    access_config {}
  }


    connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("/home/ricardo/work-out/id_rsa")
    host        = self.network_interface[0].access_config[0].nat_ip
  }



provisioner "file" {
    source      = "/home/ricardo/sonar-cube/sonar.service"
    destination = "/tmp/sonar.service"
}

provisioner "file" {
    source      = "/home/ricardo/sonar-cube/sonar-scanner.sh"
    destination = "/tmp/sonar-scanner.sh"
}

provisioner "file" {
    source      = "/home/ricardo/sonar-cube/install.sh"
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