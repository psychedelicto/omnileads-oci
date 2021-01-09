variable "region" {}
variable "tenancy_ocid" {}
variable "customer_name" {}

#vvariable "compartment_ocid" {}

variable "vcn_name" {
  default = "OML"
}

variable "vcn_cidr" {
  default = "10.72.0.0/16"
}

variable "subnet_cidr_block"{}

variable "vcn_dns_label" {}
variable "instance_display_name" {}
variable "source_ocid" {
  default = "ocid1.image.oc1.sa-santiago-1.aaaaaaaajkao23nrjfubajeojaxsc6gp3gvxqr7quif4nfzb7e7qivetze2q"
}
