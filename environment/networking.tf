module networking {
  source                          = "../../oci-terraform-modules/networking"
  vcn_compartment_id              = oci_identity_compartment.tf-compartment.compartment_id
  vcn_cidr                        = [var.vcn_cidr]
  vcn_display_name                = var.vcn_display_name
  vcn_dns_label                   = var.vcn_display_name
  internet_gateway_display_name   = var.vcn_display_name
  nat_gateway_display_name        = var.vcn_display_name
  subnet_public_cidr_block        = var.subnet_public_cidr_block
  subnet_private_cidr_block       = var.subnet_private_cidr_block
}

module security_group {
  source                          = "../../oci-terraform-modules/security_group"
  vcn_id                          = module.networking.vcn_id
  vcn_compartment_id              = oci_identity_compartment.tf-compartment.compartment_id
  public_subnet_cidr              = module.networking.public_subnet_cidr
  private_subnet_cidr             = module.networking.private_subnet_cidr
  vcn_cidr                        = module.networking.vcn_cidr
}


resource "oci_dns_rrset" "tenant_rrset" {
  zone_name_or_id                 = var.dns_zone_name
  domain                          = var.dns_fqdn
  rtype                           = "A"

    #Optional
    compartment_id                = oci_identity_compartment.tf-compartment.compartment_id
    items {
        domain                    = var.dns_fqdn
        rtype                     = "A"
        rdata                     = module.omlapp_instance.ipv4_address_public
        ttl                       = "900"
    }
}
