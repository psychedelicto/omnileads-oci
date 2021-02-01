# RTPENGINE Instance -- RTPENGINE Instance  -- RTPENGINE Instance  -- RTPENGINE Instance
# RTPENGINE Instance -- RTPENGINE Instance  -- RTPENGINE Instance  -- RTPENGINE Instance
module "rtpengine_instance" {
    source                      = "../../oci-terraform-modules/instance"

    compartment_id              = oci_identity_compartment.tf-compartment.compartment_id
    availability_domain         = var.rtpengine_instance_availability_domain
    shape                       = var.rtpengine_instance_shape
    display_name                = var.rtpengine_instance_display_name
    fqdn                        = var.rtpengine_instance_display_name
    nsg_ids                     = [oci_core_network_security_group.rtpengine_network_security_group.id]
    subnet_id                   = oci_core_subnet.public_A_subnet.id
    assign_public_ip            = true
    ssh_private_key             = var.ssh_private_key
    user_data                   = base64encode(file(var.rtpengine_user_data))
    os_ocid                     = var.centos_ocid
}


# RTPENGINE Firewall -- RTPENGINE Firewall  -- RTPENGINE Firewall  -- RTPENGINE Firewall
# RTPENGINE Firewall -- RTPENGINE Firewall  -- RTPENGINE Firewall  -- RTPENGINE Firewall
resource "oci_core_network_security_group" "rtpengine_network_security_group" {
    compartment_id         = oci_identity_compartment.tf-compartment.compartment_id
    vcn_id                 = oci_core_vcn.hipotecario_vcn.id
}

# TCP -- TCP -- TCP -- TCP -- TCP -- TCP -- TCP -- TCP -- TCP -- TCP -- TCP -- TCP
resource "oci_core_network_security_group_security_rule" "rtpengine_sg_ssh_rules" {
    network_security_group_id   = oci_core_network_security_group.rtpengine_network_security_group.id
    direction                   = "INGRESS"
    protocol                    = "6"
    description                 = var.rtpengine_security_group_ssh_description
    source                      = var.rtpengine_security_group_ssh_source
    tcp_options {

        destination_port_range {
            min = var.rtpengine_security_group_ssh_dst_port
            max = var.rtpengine_security_group_ssh_dst_port
        }
        source_port_range {
            min = var.rtpengine_security_group_ssh_src_port_min
            max = var.rtpengine_security_group_ssh_src_port_max
        }
    }
}
resource "oci_core_network_security_group_security_rule" "rtpengine_sg_ctrl_rules" {
    network_security_group_id   = oci_core_network_security_group.rtpengine_network_security_group.id
    direction                   = "INGRESS"
    protocol                    = "6"
    description                 = var.rtpengine_security_group_ssh_description
    source                      = var.rtpengine_security_group_ssh_source
    tcp_options {

        destination_port_range {
            min = "22222"
            max = "22222"
        }
        source_port_range {
            min = var.rtpengine_security_group_ssh_src_port_min
            max = var.rtpengine_security_group_ssh_src_port_max
        }
    }
}

# UDP -- UDP -- UDP -- UDP -- UDP -- UDP -- UDP -- UDP -- UDP -- UDP -- UDP -- UDP
resource "oci_core_network_security_group_security_rule" "rtpengine_sg_rtp_rules" {
    network_security_group_id   = oci_core_network_security_group.rtpengine_network_security_group.id
    direction                   = "INGRESS"
    protocol                    = "17"
    description                 = var.rtpengine_security_group_rtp_description
    source                      = var.rtpengine_security_group_rtp_source
    udp_options {

        destination_port_range {
            min = var.rtpengine_security_group_rtp_dst_port_min
            max = var.rtpengine_security_group_rtp_dst_port_max
        }
        source_port_range {
            min = var.rtpengine_security_group_rtp_src_port_min
            max = var.rtpengine_security_group_rtp_src_port_max
        }
    }
}
