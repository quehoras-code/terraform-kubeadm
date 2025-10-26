resource "yandex_vpc_network" "k8snet" {
    name = "k8snet"
}

resource "yandex_vpc_subnet" "k8s_subnet" {
    name = "k8s_subnet"
    zone = var.compute_default_zone
    network_id = yandex_vpc_network.k8snet.id
    v4_cidr_blocks = ["10.8.1.0/24"]
}

