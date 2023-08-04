resource "google_compute_instance" "test" {
  name         = "test"
  machine_type = var.mtype
  zone         = "us-central1-a"

  tags = ["foo", "bar"]
 count = var.istrue? 0 : 1
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }
  network_interface {
    network = "default"
}
}