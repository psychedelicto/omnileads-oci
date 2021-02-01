# mariadb Instance -- mariadb Instance  -- mariadb Instance  -- mariadb Instance
# mariadb Instance -- mariadb Instance  -- mariadb Instance  -- mariadb Instance

data "template_file" "mariadb" {
  template = file(var.mariadb_user_data)

  vars     = {
    mysql_username              = var.dialer_mysql_user
    mysql_password              = var.dialer_mysql_pass
    }
}


module "mariadb_instance" {
    source                      = "../../oci-terraform-modules/instance"

    compartment_id              = oci_identity_compartment.tf-compartment.compartment_id
    availability_domain         = var.mariadb_instance_availability_domain
    shape                       = var.mariadb_instance_shape
    display_name                = var.mariadb_instance_display_name
    fqdn                        = var.mariadb_instance_display_name
    nsg_ids                     = [oci_core_network_security_group.mariadb_network_security_group.id]
    subnet_id                   = oci_core_subnet.private_A_subnet.id
    assign_public_ip            = false
    ssh_private_key             = var.ssh_private_key
    os_ocid                     = var.centos_ocid
    user_data                   = base64encode(data.template_file.mariadb.rendered)
}

resource "oci_core_network_security_group" "mariadb_network_security_group" {
    compartment_id              = oci_identity_compartment.tf-compartment.compartment_id
    vcn_id                      = oci_core_vcn.hipotecario_vcn.id
}

resource "oci_core_network_security_group_security_rule" "mariadb_sg_ssh_rules" {
    network_security_group_id   = oci_core_network_security_group.mariadb_network_security_group.id
    direction                   = "INGRESS"
    protocol                    = "6"
    description                 = var.mariadb_security_group_ssh_description
    source                      = var.mariadb_security_group_ssh_source
    tcp_options {

        destination_port_range {
            min = var.mariadb_security_group_ssh_dst_port
            max = var.mariadb_security_group_ssh_dst_port
        }
        source_port_range {
            min = var.mariadb_security_group_ssh_src_port_min
            max = var.mariadb_security_group_ssh_src_port_max
        }
    }
}

resource "oci_core_network_security_group_security_rule" "mariadb_sg_rtp_rules" {
    network_security_group_id   = oci_core_network_security_group.mariadb_network_security_group.id
    direction                   = "INGRESS"
    protocol                    = "6"
    description                 = var.mariadb_security_group_rtp_description
    source                      = var.mariadb_security_group_rtp_source
    tcp_options {

        destination_port_range {
            min = var.mariadb_security_group_rtp_dst_port_min
            max = var.mariadb_security_group_rtp_dst_port_max
        }
        source_port_range {
            min = var.mariadb_security_group_rtp_src_port_min
            max = var.mariadb_security_group_rtp_src_port_max
        }
    }
}
