module "vcn" {
  source  = "oracle-terraform-modules/vcn/oci"
  version = "1.0.3"

  # provider parameters
  region = var.region

  # general oci parameters
  compartment_id = oci_identity_compartment.tf-compartment.compartment_id
  label_prefix   = "fts"

  # vcn parameters
  internet_gateway_enabled = true
  nat_gateway_enabled      = true
  #service_gateway_enabled  = true
  #tags                     = var.tags
  vcn_cidr                 = var.vcn_cidr
  vcn_dns_label            = var.vcn_dns_label
  vcn_name                 = var.vcn_name
}

resource "oci_core_subnet" "public_A_subnet" {
    #Required
    cidr_block = var.subnet_cidr_block
    compartment_id = oci_identity_compartment.tf-compartment.compartment_id
    vcn_id = module.vcn.vcn_id

}
