
# VPC
resource "google_compute_network" "vpc" {
  name                    = "${var.project_id}-demo-vpc"
  auto_create_subnetworks = "false"
  routing_mode            = "REGIONAL"
}

# Internet Gateway
resource "google_compute_route" "internet_access" {
  name        = "internet-access"
  dest_range  = "0.0.0.0/0"
  network     = google_compute_network.vpc.self_link
  next_hop_gateway = "default-internet-gateway"
}

# public Subnet
resource "google_compute_subnetwork" "public_subnet" {
  name          = "${var.project_id}-public-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = "${var.region}"
  network       = google_compute_network.vpc.self_link
  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}

# Private Subnet
resource "google_compute_subnetwork" "private_subnet" {
  name          = "${var.project_id}-private-subnet"
  ip_cidr_range = "10.0.2.0/24"
  region        = "${var.region}"
  network       = google_compute_network.vpc.self_link
  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}


resource "google_compute_router" "router" {
  name    = "${var.project_id}-router"
  region  = google_compute_subnetwork.public_subnet.region
  network = google_compute_network.vpc.self_link

  bgp {
    asn = 64514
  }
}

resource "google_compute_address" "static-ip-address" {
  name = "static-ip-address"
  region        = "${var.region}"
  subnetwork   = google_compute_subnetwork.private_subnet.id
  address_type = "INTERNAL"
  address      = "10.0.2.42"
}