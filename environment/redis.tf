# redis Instance -- redis Instance  -- redis Instance  -- redis Instance
# redis Instance -- redis Instance  -- redis Instance  -- redis Instance
module "redis_instance" {
    source                      = "../../oci-terraform-modules/instance"

    compartment_id              = oci_identity_compartment.tf-compartment.compartment_id
    availability_domain         = var.redis_instance_availability_domain
    shape                       = var.redis_instance_shape
    display_name                = var.redis_instance_display_name
    fqdn                        = var.redis_instance_display_name
    nsg_ids                     = [module.security_group.redis_sg_id,module.security_group.ssh_sg_id]
    subnet_id                   = module.networking.private_subnet_id
    assign_public_ip            = false
    ssh_private_key             = var.ssh_private_key
    user_data                   = base64encode(file(var.redis_user_data))
    os_ocid                     = var.ubuntu_ocid
}
