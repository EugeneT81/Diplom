resource "yandex_kubernetes_cluster" "yc-cluster" {
  name        = "yc-cluster"
  description = "YC cluster"

  network_id = "${yandex_vpc_network.network-vpc.id}"

  master {
    regional {
      region = "ru-central1"

      location {
        zone      = "${yandex_vpc_subnet.subnet-a.zone}"
        subnet_id = "${yandex_vpc_subnet.subnet-a.id}"
      }

      location {
        zone      = "${yandex_vpc_subnet.subnet-b.zone}"
        subnet_id = "${yandex_vpc_subnet.subnet-b.id}"
      }

      location {
        zone      = "${yandex_vpc_subnet.subnet-d.zone}"
        subnet_id = "${yandex_vpc_subnet.subnet-d.id}"
      }
    }

    version   = "1.29"
    public_ip = true

    maintenance_policy {
      auto_upgrade = true
    }
    
  }

  service_account_id      = data.yandex_iam_service_account.terafform.id
  node_service_account_id = data.yandex_iam_service_account.terafform.id


  release_channel = "STABLE"
}