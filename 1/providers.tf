terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
	  version = "0.142.0"
    }
  }
  required_version = ">= 0.13"
   
  
}

provider "yandex" {
  service_account_key_file = file("~/.authorized_key.json")
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}
