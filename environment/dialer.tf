# dialer Instance -- dialer Instance  -- dialer Instance  -- dialer Instance
# dialer Instance -- dialer Instance  -- dialer Instance  -- dialer Instance


data "template_file" "dialer" {
  template = file(var.dialer_user_data)

  vars = {
    mysql_host                = module.mariadb_instance.private-ip-for-compute-instance
    mysql_database            = var.dialer_database
    mysql_username            = var.dialer_database_username
    mysql_password            = var.dialer_database_password
    }
}

module "dialer_instance" {
    source                      = "../../oci-terraform-modules/instance"

    compartment_id              = oci_identity_compartment.tf-compartment.compartment_id
    availability_domain         = var.dialer_instance_availability_domain
    shape                       = var.dialer_instance_shape
    display_name                = var.dialer_instance_display_name
    nsg_ids                     = [oci_core_network_security_group.dialer_network_security_group.id]
    subnet_id                   = oci_core_subnet.public_A_subnet.id
    assign_public_ip            = true
    ssh_private_key             = var.ssh_private_key
    os_ocid                     = var.centos_ocid
    user_data                   = base64encode(data.template_file.dialer.rendered)
}

resource "oci_core_network_security_group" "dialer_network_security_group" {
    compartment_id         = oci_identity_compartment.tf-compartment.compartment_id
    vcn_id                 = oci_core_vcn.hipotecario_vcn.id
}

resource "oci_core_network_security_group_security_rule" "dialer_sg_ssh_rules" {
    network_security_group_id   = oci_core_network_security_group.dialer_network_security_group.id
    direction                   = "INGRESS"
    protocol                    = "6"
    description                 = var.dialer_security_group_ssh_description
    source                      = var.dialer_security_group_ssh_source
    tcp_options {

        destination_port_range {
            min = var.dialer_security_group_ssh_dst_port
            max = var.dialer_security_group_ssh_dst_port
        }
        source_port_range {
            min = var.dialer_security_group_ssh_src_port_min
            max = var.dialer_security_group_ssh_src_port_max
        }
    }
}

resource "oci_core_network_security_group_security_rule" "dialer_sg_rtp_rules" {
    network_security_group_id   = oci_core_network_security_group.dialer_network_security_group.id
    direction                   = "INGRESS"
    protocol                    = "6"
    description                 = var.dialer_security_group_rtp_description
    source                      = var.dialer_security_group_rtp_source
    tcp_options {

        destination_port_range {
            min = var.dialer_security_group_rtp_dst_port_min
            max = var.dialer_security_group_rtp_dst_port_max
        }
        source_port_range {
            min = var.dialer_security_group_rtp_src_port_min
            max = var.dialer_security_group_rtp_src_port_max
        }
    }
}
