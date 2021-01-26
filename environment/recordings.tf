# # recording FS Instance -- recording FS Instance  -- recording FS Instance  -- recording FS Instance
# # recording FS Instance -- recording FS Instance  -- recording FS Instance  -- recording FS Instance
#
# data "template_file" "mysql" {
#   template = file(var.dialer_user_data)
#
#   vars = {
#     mysql_username            = var.dialer_mysql_user
#     mysql_password            = var.dialer_mysql_pass
#     }
# }
#
#
# module "recording_fs_instance" {
#     source                      = "../../oci-terraform-modules/instance"
#
#     compartment_id              = oci_identity_compartment.tf-compartment.compartment_id
#     availability_domain         = var.recording_fs_instance_availability_domain
#     shape                       = var.recording_fs_instance_shape
#     display_name                = var.recording_fs_instance_display_name
#     nsg_ids                     = [oci_core_network_security_group.recording_fs_network_security_group.id]
#     subnet_id                   = oci_core_subnet.public_A_subnet.id
#     assign_public_ip            = true
#     ssh_private_key             = var.ssh_private_key
#     os_ocid                     = var.centos_ocid
#     user_data                   = base64encode(data.template_file.mysql)
# }
#
# resource "oci_core_network_security_group" "recording_fs_network_security_group" {
#     compartment_id         = oci_identity_compartment.tf-compartment.compartment_id
#     vcn_id                 = oci_core_vcn.hipotecario_vcn.id
# }
#
# resource "oci_core_network_security_group_security_rule" "recording_fs_sg_ssh_rules" {
#     network_security_group_id   = oci_core_network_security_group.recording_fs_network_security_group.id
#     direction                   = "INGRESS"
#     protocol                    = "6"
#     description                 = var.recording_fs_security_group_ssh_description
#     source                      = var.recording_fs_security_group_ssh_source
#     tcp_options {
#
#         destination_port_range {
#             min = var.recording_fs_security_group_ssh_dst_port
#             max = var.recording_fs_security_group_ssh_dst_port
#         }
#         source_port_range {
#             min = var.recording_fs_security_group_ssh_src_port_min
#             max = var.recording_fs_security_group_ssh_src_port_max
#         }
#     }
# }
#
# resource "oci_core_network_security_group_security_rule" "recording_fs_sg_rtp_rules" {
#     network_security_group_id   = oci_core_network_security_group.recording_fs_network_security_group.id
#     direction                   = "INGRESS"
#     protocol                    = "6"
#     description                 = var.recording_fs_security_group_rtp_description
#     source                      = var.recording_fs_security_group_rtp_source
#     tcp_options {
#
#         destination_port_range {
#             min = var.recording_fs_security_group_rtp_dst_port_min
#             max = var.recording_fs_security_group_rtp_dst_port_max
#         }
#         source_port_range {
#             min = var.recording_fs_security_group_rtp_src_port_min
#             max = var.recording_fs_security_group_rtp_src_port_max
#         }
#     }
# }
