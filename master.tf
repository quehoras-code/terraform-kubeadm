data "yandex_compute_image" "debian" {
    family = "debian-12"
}

resource "yandex_compute_instance" "master" {
    name = "master"
    platform_id = "standard-v1"

    resources {
        cores = 2
        memory = 1
        core_fraction = 20
    }

    boot_disk {
        initialize_params {
            name = "master-boot"
            size = 8
            image_id = data.yandex_compute_image.debian.id
            type = "network-hdd"
        }
    }
    network_interface {
        subnet_id = yandex_vpc_subnet.k8s_subnet.id
        nat = true
    }
    metadata = {
        serial-port-enable = true
        ssh-keys = "debian:${local.ssh_key}"
  }
}