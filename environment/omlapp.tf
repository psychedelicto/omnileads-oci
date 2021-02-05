# omlapp Instance -- omlapp Instance  -- omlapp Instance  -- omlapp Instance
# omlapp Instance -- omlapp Instance  -- omlapp Instance  -- omlapp Instance

data "template_file" "omlapp" {
  template = file(var.omlapp_user_data)

  vars = {
  NIC                           = var.network_interface
  #omlapp_hostname               = var.omlapp_hostname
  omnileads_release             = var.oml_release
  ami_user                      = var.ami_user
  ami_password                  = var.ami_password
  dialer_user                   = var.dialer_user
  dialer_password               = var.dialer_password
  ecctl                         = var.ecctl
  pg_port                       = var.pg_port
  pg_database                   = var.pg_database
  pg_username                   = var.pg_username
  pg_password                   = var.pg_password
  pg_default_database           = var.pg_database_name
  pg_default_user               = var.pg_database_user
  pg_default_password           = var.pg_database_password
  pg_host                       = module.postgresql_instance.ipv4_address_private
  rtpengine_host                = module.rtpengine_instance.ipv4_address_private
  redis_host                    = module.redis_instance.ipv4_address_private
  dialer_host                   = module.dialer_instance.ipv4_address_private
  mysql_host                    = module.mariadb_instance.ipv4_address_private
  websocket_host                = var.websocket_host
  websocket_port                = var.websocket_port
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
    fqdn                        = var.omlapp_instance_display_name
    nsg_ids                     = [module.security_group.omlapp_sg_id,module.security_group.ssh_sg_id]
    subnet_id                   = module.networking.public_subnet_id
    assign_public_ip            = true
    ssh_private_key             = var.ssh_private_key
    user_data                   = base64encode(data.template_file.omlapp.rendered)
    os_ocid                     = var.centos_ocid
}
