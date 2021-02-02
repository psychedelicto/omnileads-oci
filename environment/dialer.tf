# dialer Instance -- dialer Instance  -- dialer Instance  -- dialer Instance
# dialer Instance -- dialer Instance  -- dialer Instance  -- dialer Instance


data "template_file" "dialer" {
  template = file(var.dialer_user_data)

  vars = {
    mysql_host                = module.mariadb_instance.ipv4_address_private
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
    fqdn                        = var.dialer_instance_display_name
    nsg_ids                     = [module.security_group.dialer_sg_id,module.security_group.ssh_sg_id]
    subnet_id                   = module.networking.public_subnet_id
    assign_public_ip            = true
    ssh_private_key             = var.ssh_private_key
    os_ocid                     = var.centos_ocid
    user_data                   = base64encode(data.template_file.dialer.rendered)
}
