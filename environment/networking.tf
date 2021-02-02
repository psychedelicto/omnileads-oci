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


# resource "oci_core_vcn" "hipotecario_vcn" {
#     compartment_id  = oci_identity_compartment.tf-compartment.compartment_id
#     cidr_blocks     = [var.vcn_cidr]
#     display_name    = var.vcn_display_name
#     dns_label       = var.vcn_dns_label
# }
#
# resource "oci_core_internet_gateway" "igw" {
#     compartment_id  = oci_identity_compartment.tf-compartment.compartment_id
#     vcn_id          = oci_core_vcn.hipotecario_vcn.id
#     enabled         = var.internet_gateway_enabled
#     display_name    = var.internet_gateway_display_name
# }
#
# resource "oci_core_nat_gateway" "natgw" {
#     compartment_id  = oci_identity_compartment.tf-compartment.compartment_id
#     vcn_id          = oci_core_vcn.hipotecario_vcn.id
#     display_name    = var.nat_gateway_display_name
# }
#
# resource "oci_core_route_table" "public_route_table" {
#     compartment_id        = oci_identity_compartment.tf-compartment.compartment_id
#     vcn_id                = oci_core_vcn.hipotecario_vcn.id
#     display_name          = "all traffic_public"
#     route_rules {
#         network_entity_id   = oci_core_internet_gateway.igw.id
#         destination         = "0.0.0.0/0"
#         destination_type    = "CIDR_BLOCK"
#     }
# }
#
# resource "oci_core_route_table" "private_route_table" {
#     compartment_id        = oci_identity_compartment.tf-compartment.compartment_id
#     vcn_id                = oci_core_vcn.hipotecario_vcn.id
#     display_name          = "all traffic_private"
#     route_rules {
#         network_entity_id   = oci_core_nat_gateway.natgw.id
#         destination         = "0.0.0.0/0"
#         destination_type    = "CIDR_BLOCK"
#     }
# }
#
# resource "oci_core_subnet" "public_A_subnet" {
#     cidr_block        = var.subnet_public_cidr_block
#     compartment_id    = oci_identity_compartment.tf-compartment.compartment_id
#     vcn_id            = oci_core_vcn.hipotecario_vcn.id
#     route_table_id    = oci_core_route_table.public_route_table.id
#     dns_label         = "public"
# }
#
#
# resource "oci_core_subnet" "private_A_subnet" {
#     cidr_block                  = var.subnet_private_cidr_block
#     compartment_id              = oci_identity_compartment.tf-compartment.compartment_id
#     vcn_id                      = oci_core_vcn.hipotecario_vcn.id
#     prohibit_public_ip_on_vnic  = true
#     route_table_id    = oci_core_route_table.private_route_table.id
#     dns_label         = "private"
# }

#
#
# resource "oci_core_security_list" "oml_security_list" {
#     #Required
#     compartment_id = oci_identity_compartment.tf-compartment.compartment_id
#     vcn_id = oci_core_vcn.hipotecario_vcn.id
#
#     display_name = "OML default SL"
#
#     egress_security_rules {
#         destination = "0.0.0.0/0"
#         protocol = "6"
#
#         tcp_options {
#             max = "65353"
#             min = "1024"
#             source_port_range {
#                 max = "65353"
#                 min = "1"
#             }
#         }
#     }
#     egress_security_rules {
#         destination = "0.0.0.0/0"
#         protocol = "6"
#
#         tcp_options {
#             max = "65353"
#             min = "1024"
#             source_port_range {
#                 max = "65353"
#                 min = "1"
#             }
#         }
#     }
#     egress_security_rules {
#         destination = "0.0.0.0/0"
#         protocol = "17"
#
#         udp_options {
#             max = "65353"
#             min = "1024"
#             source_port_range {
#                 max = "65353"
#                 min = "1"
#             }
#         }
#     }
#     ingress_security_rules {
#         protocol = "6"
#         source = "0.0.0.0/0"
#
#         description = "all HTTP"
#
#         #source_type = "CIDR"
#         tcp_options {
#
#             max = "443"
#             min = "443"
#             source_port_range {
#                 max = "65353"
#                 min = "1024"
#             }
#         }
#     }
#     ingress_security_rules {
#         protocol = "6"
#         source = "0.0.0.0/0"
#
#         description = "all HTTP"
#
#         #source_type = "CIDR"
#         tcp_options {
#
#             max = "8080"
#             min = "8080"
#             source_port_range {
#                 max = "65353"
#                 min = "1024"
#             }
#         }
#     }
#     ingress_security_rules {
#         protocol = "6"
#         source = "0.0.0.0/0"
#
#         description = "all SSH"
#
#         #source_type = "CIDR"
#         tcp_options {
#
#             max = "22"
#             min = "22"
#             source_port_range {
#                 max = "65353"
#                 min = "1024"
#             }
#         }
#     }
#     ingress_security_rules {
#         protocol = "17"
#         source = "0.0.0.0/0"
#
#         description = "all RTP & sRTP"
#
#         #source_type = "CIDR"
#         udp_options {
#
#             max = "50000"
#             min = "20000"
#             source_port_range {
#                 max = "65353"
#                 min = "1024"
#             }
#         }
#     }
#
# }
