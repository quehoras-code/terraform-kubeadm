output "ip_address" {
  value = yandex_compute_instance.master.network_interface.0.nat_ip_address
}