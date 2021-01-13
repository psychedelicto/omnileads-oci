# POSTGRESQL Instance -- POSTGRESQL Instance  -- POSTGRESQL Instance  -- POSTGRESQL Instance
# POSTGRESQL Instance -- POSTGRESQL Instance  -- POSTGRESQL Instance  -- POSTGRESQL Instance
module "postgresql_instance" {
    source                      = "../../oci-terraform-modules/instance"

    compartment_id              = oci_identity_compartment.tf-compartment.compartment_id
    availability_domain         = var.postgresql_instance_availability_domain
    shape                       = var.postgresql_instance_shape
    display_name                = var.postgresql_instance_display_name
    nsg_ids                     = [oci_core_network_security_group.postgresql_network_security_group.id]
    subnet_id                   = oci_core_subnet.private_A_subnet.id
    assign_public_ip            = false
    ssh_private_key             = var.ssh_private_key
    user_data                   = base64encode(file(var.postgresql_user_data))
    os_ocid                     = var.centos_ocid
}



resource "oci_core_network_security_group" "postgresql_network_security_group" {
    compartment_id         = oci_identity_compartment.tf-compartment.compartment_id
    vcn_id                 = oci_core_vcn.hipotecario_vcn.id
}

resource "oci_core_network_security_group_security_rule" "postgresql_sg_ssh_rules" {
    network_security_group_id   = oci_core_network_security_group.postgresql_network_security_group.id
    direction                   = "INGRESS"
    protocol                    = "6"
    description                 = var.postgresql_security_group_ssh_description
    source                      = var.postgresql_security_group_ssh_source
    tcp_options {

        destination_port_range {
            min = var.postgresql_security_group_ssh_dst_port
            max = var.postgresql_security_group_ssh_dst_port
        }
        source_port_range {
            min = var.postgresql_security_group_ssh_src_port_min
            max = var.postgresql_security_group_ssh_src_port_max
        }
    }
}

resource "oci_core_network_security_group_security_rule" "postgresql_sg_rtp_rules" {
    network_security_group_id   = oci_core_network_security_group.postgresql_network_security_group.id
    direction                   = "INGRESS"
    protocol                    = "6"
    description                 = var.postgresql_security_group_rtp_description
    source                      = var.postgresql_security_group_rtp_source
    tcp_options {

        destination_port_range {
            min = var.postgresql_security_group_rtp_dst_port_min
            max = var.postgresql_security_group_rtp_dst_port_max
        }
        source_port_range {
            min = var.postgresql_security_group_rtp_src_port_min
            max = var.postgresql_security_group_rtp_src_port_max
        }
    }
}