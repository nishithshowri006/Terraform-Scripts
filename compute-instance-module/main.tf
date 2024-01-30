data "google_compute_network" "shared_vpc" {
  name = var.shared_vpc.name
  project = var.shared_vpc.project_id
}

resource "google_service_account" "default" {
  account_id = var.service_account
}

resource "google_compute_instance" "compute_instance" {
  name = var.instance_name
  machine_type = var.machine_type.configuration
  zone = var.zone
  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = data.google_compute_network.shared_vpc.self_link
  }
  service_account {
    email = google_service_account.default.email
    scopes = [ "cloud-platform" ]
  }
  min_cpu_platform = var.machine_type.minimum_cpu_platform
}