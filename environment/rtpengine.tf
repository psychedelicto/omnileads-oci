# RTPENGINE Instance -- RTPENGINE Instance  -- RTPENGINE Instance  -- RTPENGINE Instance
# RTPENGINE Instance -- RTPENGINE Instance  -- RTPENGINE Instance  -- RTPENGINE Instance
module "rtpengine_instance" {
    source                      = "../../oci-terraform-modules/instance"

    compartment_id              = oci_identity_compartment.tf-compartment.compartment_id
    availability_domain         = var.rtpengine_instance_availability_domain
    shape                       = var.rtpengine_instance_shape
    display_name                = var.rtpengine_instance_display_name
    fqdn                        = var.rtpengine_instance_display_name
    nsg_ids                     = [module.security_group.rtpengine_sg_id,module.security_group.ssh_sg_id]
    subnet_id                   = module.networking.public_subnet_id
    assign_public_ip            = true
    ssh_private_key             = var.ssh_private_key
    user_data                   = base64encode(file(var.rtpengine_user_data))
    os_ocid                     = var.centos_ocid
}
