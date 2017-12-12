variable "credentials-access-key-string" {}
variable "credentials-secret-key-string" {}
variable "general-region-string" {}
variable "general-availability-zone-string" {}
variable "vm-expiration-days-string" {}
variable "vm-size-string" {}
variable "vm-password-string" {}
variable "storage-size-string" {}
variable "storage-type-string" {}
variable "network-incoming-ports-string" {}
variable "bootstrap-public-key-file" {}
variable "bootstrap-private-key-file" {}
variable "bootstrap-script-file" {}
variable "title" {}
variable "description" {}

variable "image-ami-string" {}

variable "image-names-map" {
  type = "map"
  default = {
    "Ubuntu Server Linux 16.04" = "ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"
    "Windows Server 2016" = "Windows_Server-2016-English-Full-Base-*"
  }
}

variable "image-owners-map" {
  type = "map"
  default = {
    "Ubuntu Server Linux 16.04" = "099720109477"
    "Windows Server 2016" = "801119661308"
  }
}