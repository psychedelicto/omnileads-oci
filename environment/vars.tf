variable "region" {}
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}

variable "customer_name" {}
variable "ssh_public_key" {}
variable "ssh_private_key" {}

# NETWORKING -- NETWORKING -- NETWORKING -- NETWORKING -- NETWORKING
variable "vcn_display_name" {}
variable "vcn_cidr" {}
variable "internet_gateway_enabled" {
  default     = true
  type        = bool
}
variable "internet_gateway_display_name" {}
variable "nat_gateway_display_name" {}

variable "nat_gateway_enabled" {
  default     = true
  type        = bool
}
variable "subnet_public_cidr_block"{}
variable "subnet_private_cidr_block"{}
variable "vcn_dns_label" {}

# OPERATIVE SYSTEM INSTANCES -- OPERATIVE SYSTEM INSTANCES -- OPERATIVE SYSTEM INSTANCES
variable "centos_ocid" {
  default = "ocid1.image.oc1.sa-santiago-1.aaaaaaaajkao23nrjfubajeojaxsc6gp3gvxqr7quif4nfzb7e7qivetze2q"
}
variable "ubuntu_ocid" {
  default = "ocid1.image.oc1.sa-santiago-1.aaaaaaaay4doekqj3dgg3mpjysow5v4dv7xmeb5bwdtqj4rk7gbiogqzctta"
}


variable "tags" {
  description = "simple key-value pairs to tag the resources created"
  type        = map(any)
  default = {
    "environment" = "dev"
  }
}

variable "ssh_authorized_keys_file" {}

# rtpengine instance -- rtpengine instance -- rtpengine instance
# rtpengine instance -- rtpengine instance -- rtpengine instance
variable "rtpengine_instance_display_name" {}
variable "rtpengine_instance_shape" {}
variable "rtpengine_instance_availability_domain" {}
variable "rtpengine_user_data" {}

variable "rtpengine_security_group_ssh_source" {}
variable "rtpengine_security_group_ssh_description" {
  default = "nsg for ssh"
}
variable "rtpengine_security_group_ssh_dst_port" {}
variable "rtpengine_security_group_ssh_src_port_min" {}
variable "rtpengine_security_group_ssh_src_port_max" {}

variable "rtpengine_security_group_rtp_source" {}
variable "rtpengine_security_group_rtp_description" {
  default = "nsg for rtp / audio"
}
variable "rtpengine_security_group_rtp_dst_port_min" {}
variable "rtpengine_security_group_rtp_dst_port_max" {}
variable "rtpengine_security_group_rtp_src_port_min" {}
variable "rtpengine_security_group_rtp_src_port_max" {}


# redis instance -- redis instance -- redis instance
# redis instance -- redis instance -- redis instance
variable "redis_instance_display_name" {}
variable "redis_instance_shape" {}
variable "redis_instance_availability_domain" {}
variable "redis_user_data" {}

variable "redis_security_group_ssh_source" {}
variable "redis_security_group_ssh_description" {
  default = "nsg for ssh"
}
variable "redis_security_group_ssh_dst_port" {}
variable "redis_security_group_ssh_src_port_min" {}
variable "redis_security_group_ssh_src_port_max" {}

variable "redis_security_group_rtp_source" {}
variable "redis_security_group_rtp_description" {
  default = "nsg for redis service"
}
variable "redis_security_group_rtp_dst_port_min" {}
variable "redis_security_group_rtp_dst_port_max" {}
variable "redis_security_group_rtp_src_port_min" {}
variable "redis_security_group_rtp_src_port_max" {}


# postgresql instance -- postgresql instance -- postgresql instance
# postgresql instance -- postgresql instance -- postgresql instance
variable "postgresql_instance_display_name" {}
variable "postgresql_instance_shape" {}
variable "postgresql_instance_availability_domain" {}
variable "postgresql_user_data" {}


variable "postgresql_security_group_ssh_source" {}
variable "postgresql_security_group_ssh_description" {
  default = "nsg for ssh"
}
variable "postgresql_security_group_ssh_dst_port" {}
variable "postgresql_security_group_ssh_src_port_min" {}
variable "postgresql_security_group_ssh_src_port_max" {}

variable "postgresql_security_group_rtp_source" {}
variable "postgresql_security_group_rtp_description" {
  default = "nsg for postgresql service"
}
variable "postgresql_security_group_rtp_dst_port_min" {}
variable "postgresql_security_group_rtp_dst_port_max" {}
variable "postgresql_security_group_rtp_src_port_min" {}
variable "postgresql_security_group_rtp_src_port_max" {}


# dialer instance -- dialer instance -- dialer instance
# dialer instance -- dialer instance -- dialer instance
variable "dialer_instance_display_name" {}
variable "dialer_instance_shape" {}
variable "dialer_instance_availability_domain" {}
variable "dialer_user_data" {}

variable "dialer_security_group_ssh_source" {}
variable "dialer_security_group_ssh_description" {
  default = "nsg for ssh"
}
variable "dialer_security_group_ssh_dst_port" {}
variable "dialer_security_group_ssh_src_port_min" {}
variable "dialer_security_group_ssh_src_port_max" {}

variable "dialer_security_group_rtp_source" {}
variable "dialer_security_group_rtp_description" {
  default = "nsg for dialer service"
}
variable "dialer_security_group_rtp_dst_port_min" {}
variable "dialer_security_group_rtp_dst_port_max" {}
variable "dialer_security_group_rtp_src_port_min" {}
variable "dialer_security_group_rtp_src_port_max" {}

variable "dialer_mysql_user" {}
variable "dialer_mysql_pass" {}

variable "dialer_database" {}
variable "dialer_database_username" {}
variable "dialer_database_password" {}

# mariadb instance -- mariadb instance -- mariadb instance
# mariadb instance -- mariadb instance -- mariadb instance
variable "mariadb_instance_display_name" {}
variable "mariadb_instance_shape" {}
variable "mariadb_instance_availability_domain" {}
variable "mariadb_user_data" {}

variable "mariadb_security_group_ssh_source" {}
variable "mariadb_security_group_ssh_description" {
  default = "nsg for ssh"
}
variable "mariadb_security_group_ssh_dst_port" {}
variable "mariadb_security_group_ssh_src_port_min" {}
variable "mariadb_security_group_ssh_src_port_max" {}

variable "mariadb_security_group_rtp_source" {}
variable "mariadb_security_group_rtp_description" {
  default = "nsg for mariadb service"
}
variable "mariadb_security_group_rtp_dst_port_min" {}
variable "mariadb_security_group_rtp_dst_port_max" {}
variable "mariadb_security_group_rtp_src_port_min" {}
variable "mariadb_security_group_rtp_src_port_max" {}


# omlapp instance -- omlapp instance -- omlapp instance
# omlapp instance -- omlapp instance -- omlapp instance
variable "omlapp_instance_display_name" {}
variable "omlapp_instance_shape" {}
variable "omlapp_instance_availability_domain" {}
variable "omlapp_user_data" {}

variable "omlapp_security_group_ssh_source" {}
variable "omlapp_security_group_ssh_description" {
  default = "nsg for ssh"
}
variable "omlapp_security_group_ssh_dst_port" {}
variable "omlapp_security_group_ssh_src_port_min" {}
variable "omlapp_security_group_ssh_src_port_max" {}

variable "omlapp_security_group_rtp_source" {}
variable "omlapp_security_group_rtp_description" {
  default = "nsg for omlapp service"
}
variable "omlapp_security_group_rtp_dst_port_min" {}
variable "omlapp_security_group_rtp_dst_port_max" {}
variable "omlapp_security_group_rtp_src_port_min" {}
variable "omlapp_security_group_rtp_src_port_max" {}

variable "network_interface" {}
variable "omlapp_hostname" {}
variable "oml_release" {}
variable "ami_user" {}
variable "ami_password" {}
variable "dialer_user" {}
variable "dialer_password" {}
variable "ecctl" {}
variable "pg_database" {}
variable "pg_username" {}
variable "pg_password" {}
variable "sca" {}
variable "schedule" {}
variable "extern_ip" {}
variable "oml_tz" {}
variable "recording_ramdisk_size" {}
