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
    nsg_ids                     = [module.security_group.mysql_sg_id,module.security_group.ssh_sg_id]
    subnet_id                   = module.networking.private_subnet_id
    assign_public_ip            = false
    ssh_private_key             = var.ssh_private_key
    os_ocid                     = var.centos_ocid
    user_data                   = base64encode(data.template_file.mariadb.rendered)
}
