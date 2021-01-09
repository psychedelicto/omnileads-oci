provider "oci" {
  tenancy_ocid = var.tenancy_ocid
  user_ocid = "ocid1.user.oc1..aaaaaaaakxc4fldaazcv6jpqchsohb4rwo7dhkn5e266xykjh7fzwqs3ly4a"
  private_key_path = "~/.oci/ociterra.pem"
  fingerprint = "96:77:19:25:2c:d2:4e:c2:de:3f:7c:af:df:6f:33:19"
  region = var.region
}
