# omlapp Instance -- omlapp Instance  -- omlapp Instance  -- omlapp Instance
# omlapp Instance -- omlapp Instance  -- omlapp Instance  -- omlapp Instance

data "template_file" "omlapp" {
  template = file(var.omlapp_user_data)

  vars = {
  NIC                           = var.network_interface
  omlapp_hostname               = var.omlapp_hostname
  omnileads_release             = var.oml_release
  ami_user                      = var.ami_user
  ami_password                  = var.ami_password
  mysql_host                    = module.mariadb_instance.private-ip-for-compute-instance
  dialer_host                   = module.dialer_instance.private-ip-for-compute-instance
  dialer_user                   = var.dialer_user
  dialer_password               = var.dialer_password
  ecctl                         = var.ecctl
  pg_host                       = module.postgresql_instance.private-ip-for-compute-instance
  # pg_port                       = module.
  pg_database                   = var.pg_database
  pg_username                   = var.pg_username
  pg_password                   = var.pg_password
  # pg_default_database           = module.pgsql.database_name
  # pg_default_user               = module.pgsql.database_user
  # pg_default_password           = module.pgsql.database_password
  rtpengine_host                = module.rtpengine_instance.private-ip-for-compute-instance
  redis_host                    = module.redis_instance.private-ip-for-compute-instance
  dialer_host                   = module.dialer_instance.private-ip-for-compute-instance
  mysql_host                    = module.mariadb_instance.private-ip-for-compute-instance
  sca                           = var.sca
  schedule                      = var.schedule
  extern_ip                     = var.extern_ip
  TZ                            = var.oml_tz
  #nfs_recordings_ip             = module.droplet_recordings.ipv4_address_private
  recording_ramdisk_size        = var.recording_ramdisk_size
  }
}

module "omlapp_instance" {
    source                      = "../../oci-terraform-modules/instance"

    compartment_id              = oci_identity_compartment.tf-compartment.compartment_id
    availability_domain         = var.omlapp_instance_availability_domain
    shape                       = var.omlapp_instance_shape
    display_name                = var.omlapp_instance_display_name
    nsg_ids                     = [oci_core_network_security_group.omlapp_network_security_group.id]
    subnet_id                   = oci_core_subnet.private_A_subnet.id
    assign_public_ip            = false
    ssh_private_key             = var.ssh_private_key
    user_data                   = base64encode(data.template_file.omlapp.rendered)
    os_ocid                     = var.centos_ocid
}



resource "oci_core_network_security_group" "omlapp_network_security_group" {
    compartment_id         = oci_identity_compartment.tf-compartment.compartment_id
    vcn_id                 = oci_core_vcn.hipotecario_vcn.id
}

resource "oci_core_network_security_group_security_rule" "omlapp_sg_ssh_rules" {
    network_security_group_id   = oci_core_network_security_group.omlapp_network_security_group.id
    direction                   = "INGRESS"
    protocol                    = "6"
    description                 = var.omlapp_security_group_ssh_description
    source                      = var.omlapp_security_group_ssh_source
    tcp_options {

        destination_port_range {
            min = var.omlapp_security_group_ssh_dst_port
            max = var.omlapp_security_group_ssh_dst_port
        }
        source_port_range {
            min = var.omlapp_security_group_ssh_src_port_min
            max = var.omlapp_security_group_ssh_src_port_max
        }
    }
}

resource "oci_core_network_security_group_security_rule" "omlapp_sg_rtp_rules" {
    network_security_group_id   = oci_core_network_security_group.omlapp_network_security_group.id
    direction                   = "INGRESS"
    protocol                    = "6"
    description                 = var.omlapp_security_group_rtp_description
    source                      = var.omlapp_security_group_rtp_source
    tcp_options {

        destination_port_range {
            min = var.omlapp_security_group_rtp_dst_port_min
            max = var.omlapp_security_group_rtp_dst_port_max
        }
        source_port_range {
            min = var.omlapp_security_group_rtp_src_port_min
            max = var.omlapp_security_group_rtp_src_port_max
        }
    }
}
