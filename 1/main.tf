resource "yandex_storage_bucket" "terraform-s3-backend" {
  bucket = "terraform-s3-backend"
  folder_id = var.folder_id
}

data "yandex_iam_service_account" "terafform" {
  name = "terafform"
}
