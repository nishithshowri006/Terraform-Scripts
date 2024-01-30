output "compute_instance" {
    value = google_compute_instance.compute_instance.network_interface.0.network_ip
    description = "compute instance's ip address"
}