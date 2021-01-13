
resource "oci_identity_compartment" "tf-compartment" {
    # Required
    compartment_id      = var.tenancy_ocid
    description         = "Compartment for Terraform resources."
    name                = var.customer_name
}
