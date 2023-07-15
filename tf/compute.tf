# Compute Engine instance in public subnet
resource "google_compute_instance" "public_instance" {
  name         = "public-instance"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"
  tags         = ["public-subnet"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  metadata_startup_script = <<-SCRIPT
    #!/bin/bash
    apt-get update
    apt-get install -y nginx
    echo "<html><body><h1>Welcome to my website!</h1></body></html>" > /var/www/html/index.html
    systemctl enable nginx
    systemctl start nginx
  SCRIPT

  network_interface {
    subnetwork = google_compute_subnetwork.public_subnet.self_link
    access_config {
      // Assign a public IP to the instance in the public subnet
    }
  }
}

# Compute Engine instance in private subnet
resource "google_compute_instance" "private_instance" {
  name         = "private-instance"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"
  tags         = ["private-subnet"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    subnetwork         = google_compute_subnetwork.private_subnet.self_link
  }
}