module "instance" {
  source = "oracle-terraform-modules/compute-instance/oci"

  compartment_ocid           = oci_identity_compartment.tf-compartment.compartment_id
  instance_display_name      = var.instance_display_name
  source_ocid                = var.source_ocid
  subnet_ocids               = oci_core_subnet.public_A_subnet.id
  #ssh_authorized_keys        = var.ssh_authorized_keys_file
  block_storage_sizes_in_gbs = [60, 70]
}
