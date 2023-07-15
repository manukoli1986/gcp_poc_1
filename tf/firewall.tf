# Firewall rule for public subnet
resource "google_compute_firewall" "public_subnet_firewall" {
  name    = "${var.project_id}-public-subnet-firewall"
  network = google_compute_network.vpc.self_link

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["public-subnet"]
}

# Firewall rule for private subnet
resource "google_compute_firewall" "private_subnet_firewall" {
  name    = "${var.project_id}-private-subnet-firewall"
  network = google_compute_network.vpc.self_link

  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["103.212.158.132/32"]
  target_tags   = ["private-subnet"]
}