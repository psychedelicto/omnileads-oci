resource "oci_core_vcn" "hipotecario_vcn" {
    compartment_id  = oci_identity_compartment.tf-compartment.compartment_id
    cidr_blocks     = [var.vcn_cidr]
    display_name    = var.vcn_display_name
    dns_label       = var.vcn_dns_label
}

resource "oci_core_internet_gateway" "test_internet_gateway" {
    compartment_id  = oci_identity_compartment.tf-compartment.compartment_id
    vcn_id          = oci_core_vcn.hipotecario_vcn.id
    enabled         = var.internet_gateway_enabled
    display_name    = var.internet_gateway_display_name
}


resource "oci_core_nat_gateway" "test_nat_gateway" {
    compartment_id  = oci_identity_compartment.tf-compartment.compartment_id
    vcn_id          = oci_core_vcn.hipotecario_vcn.id
    display_name    = var.nat_gateway_display_name
}

resource "oci_core_route_table" "test_route_table" {
    compartment_id        = oci_identity_compartment.tf-compartment.compartment_id
    vcn_id                = oci_core_vcn.hipotecario_vcn.id
    display_name          = "all traffic"
    route_rules {
        network_entity_id   = oci_core_internet_gateway.test_internet_gateway.id
        destination         = "0.0.0.0/0"
        destination_type    = "CIDR_BLOCK"
    }
}

resource "oci_core_subnet" "public_A_subnet" {
    cidr_block        = var.subnet_public_cidr_block
    compartment_id    = oci_identity_compartment.tf-compartment.compartment_id
    vcn_id            = oci_core_vcn.hipotecario_vcn.id
    route_table_id    = oci_core_route_table.test_route_table.id
}

resource "oci_core_subnet" "private_A_subnet" {
    cidr_block                  = var.subnet_private_cidr_block
    compartment_id              = oci_identity_compartment.tf-compartment.compartment_id
    vcn_id                      = oci_core_vcn.hipotecario_vcn.id
    prohibit_public_ip_on_vnic  = true
}
