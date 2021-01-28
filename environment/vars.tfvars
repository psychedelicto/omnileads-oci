region = "sa-santiago-1"
tenancy_ocid = "ocid1.tenancy.oc1..aaaaaaaakdzlbkkale2guohrsmtg6ewml63ku3ra7my3zq2ctj3hk4etkwja"
user_ocid = "ocid1.user.oc1..aaaaaaaakxc4fldaazcv6jpqchsohb4rwo7dhkn5e266xykjh7fzwqs3ly4a"
fingerprint = "06:64:81:8a:f6:dd:84:cb:a2:42:d6:6e:cc:ce:19:36"
private_key_path = "~/.oci/oci_api_key.pem"

ssh_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxzCcoJoUgoj3ojDNmZ5zz4Kkkjm4PYyb/3gPXZ3LV0SOfSCVfeRbTk+C5d78reKxEQWX9hLfUJocA6TASA5vGOxqrF82qXON+1OSWlOR/+pk3NXNePCXnGjoS2InqEvfRiNh22EOXTvn0Na1AaiM6spDsrUkg2A1trmVagkWD4tHPe50Ju/FmzcfmdyAbiVN59dYOzMLWO7eFcvlPqY28DvV8OcMUTYA9ljZECsbxl+nYdHUYfYuT4lkObQyNJAlQbl+TjWBjna6ydxKfVKp50HLVhDXhffbhrlzcNtuSGeOnYq6gocLJ9/re3I8VPpXM+YFYXeYlduu3QcoxqcpFwIDAQAB"
ssh_private_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDNVAC8P2ExZZzw0EQB6EJ/anI60VJXCfPYL2Q2pXQDAfNUz55ZeFiWXNvSZtvhjWv9nJIfIWJxNpZibQn8O26pp1PgEUcu5gB8/5qpB6LeRICjpeKBN61z01R+ro3KSSd7qKxFb6IsdymPBdaMB+KCrEbdDCtIHYj15DKBreprLZFmmmJMSR3grSQaW3p7hyS9oDB8KXu3kg5yO9A+jUhvNMAHezxnUWKF1CpmVy1eMcrzCQolCt2OxcJu+TIjSaR7pqgyoQnva0VYvv9bvMvOAMbbazjzHO4dLW4PFwnpvlpxHyj2JmjUmpZZCKQr4biNtS96E5h+mKzoo3OimeTjN8RCsyAwc29suN/0fr0pLiVKtHVUOmOUGQ1whpQrh3js9nXUB9WY2Iyp7KCfNiLTZY4l/z40aJ0HmK39SXX9E5QkpQsdytvCMSudegR9nMrqZHkqxTw0IBwLO+e7pak1HE+tZgDYcmmZmI2bVHpHI3sjdUpvyZKVmpLxhl4XS3k="

customer_name = "konecta"
vcn_display_name = "hipotecario"
vcn_dns_label = "hipotecario"
vcn_cidr     = "10.72.0.0/16"


internet_gateway_display_name = "hipotecario"
nat_gateway_display_name = "hipotecario"

subnet_public_cidr_block = "10.72.1.0/24"
subnet_private_cidr_block = "10.72.10.0/24"

ssh_authorized_keys_file = "~/.ssh/id_rsa.pub"


# rtpengine instance -- rtpengine instance -- rtpengine instance
# rtpengine instance -- rtpengine instance -- rtpengine instance
rtpengine_instance_display_name = "rtpengine"
rtpengine_instance_shape = "VM.Standard.E2.1"
rtpengine_instance_availability_domain = "ZxEZ:SA-SANTIAGO-1-AD-1"
rtpengine_user_data = "../user_data/rtpengine.tpl"

rtpengine_security_group_ssh_source = "0.0.0.0/0"
rtpengine_security_group_ssh_dst_port = "22"
rtpengine_security_group_ssh_src_port_min = "1024"
rtpengine_security_group_ssh_src_port_max = "65534"

rtpengine_security_group_rtp_source = "0.0.0.0/0"
rtpengine_security_group_rtp_dst_port_min = "10000"
rtpengine_security_group_rtp_dst_port_max = "60000"
rtpengine_security_group_rtp_src_port_min = "1024"
rtpengine_security_group_rtp_src_port_max = "65534"


# redis instance -- redis instance -- redis instance
# redis instance -- redis instance -- redis instance
redis_instance_display_name = "redis"
redis_instance_shape = "VM.Standard.E2.1"
redis_instance_availability_domain = "ZxEZ:SA-SANTIAGO-1-AD-1"
redis_user_data = "../user_data/redis.tpl"

redis_security_group_ssh_source = "0.0.0.0/0"
redis_security_group_ssh_dst_port = "22"
redis_security_group_ssh_src_port_min = "1024"
redis_security_group_ssh_src_port_max = "65534"

redis_security_group_rtp_source = "0.0.0.0/0"
redis_security_group_rtp_dst_port_min = "6379"
redis_security_group_rtp_dst_port_max = "6379"
redis_security_group_rtp_src_port_min = "1024"
redis_security_group_rtp_src_port_max = "65534"

# postgresql instance -- postgresql instance -- postgresql instance
# postgresql instance -- postgresql instance -- postgresql instance
postgresql_instance_display_name = "postgresql"
postgresql_instance_shape = "VM.Standard.E2.1"
postgresql_instance_availability_domain = "ZxEZ:SA-SANTIAGO-1-AD-1"
postgresql_user_data = "../user_data/postgresql.tpl"

#postgresql_password = "admin123"

postgresql_security_group_ssh_source = "0.0.0.0/0"
postgresql_security_group_ssh_dst_port = "22"
postgresql_security_group_ssh_src_port_min = "1024"
postgresql_security_group_ssh_src_port_max = "65534"

postgresql_security_group_rtp_source = "0.0.0.0/0"
postgresql_security_group_rtp_dst_port_min = "5432"
postgresql_security_group_rtp_dst_port_max = "5432"
postgresql_security_group_rtp_src_port_min = "1024"
postgresql_security_group_rtp_src_port_max = "65534"


# dialer instance -- dialer instance -- dialer instance
# dialer instance -- dialer instance -- dialer instance
dialer_instance_display_name = "dialer"
dialer_instance_shape = "VM.Standard.E2.1"
dialer_instance_availability_domain = "ZxEZ:SA-SANTIAGO-1-AD-1"
dialer_user_data = "../user_data/dialer.tpl"

dialer_security_group_ssh_source = "0.0.0.0/0"
dialer_security_group_ssh_dst_port = "22"
dialer_security_group_ssh_src_port_min = "1024"
dialer_security_group_ssh_src_port_max = "65534"

dialer_security_group_rtp_source = "0.0.0.0/0"
dialer_security_group_rtp_dst_port_min = "8080"
dialer_security_group_rtp_dst_port_max = "8080"
dialer_security_group_rtp_src_port_min = "1024"
dialer_security_group_rtp_src_port_max = "65534"

dialer_mysql_user = "wombat"
dialer_mysql_pass = "admin123"

dialer_database = "wombat"
dialer_database_username = "wombat"
dialer_database_password = "admin123"

# mariadb instance -- mariadb instance -- mariadb instance
# mariadb instance -- mariadb instance -- mariadb instance
mariadb_instance_display_name = "mariadb"
mariadb_instance_shape = "VM.Standard.E2.1"
mariadb_instance_availability_domain = "ZxEZ:SA-SANTIAGO-1-AD-1"
mariadb_user_data = "../user_data/mariadb.tpl"

mariadb_security_group_ssh_source = "0.0.0.0/0"
mariadb_security_group_ssh_dst_port = "22"
mariadb_security_group_ssh_src_port_min = "1024"
mariadb_security_group_ssh_src_port_max = "65534"

mariadb_security_group_rtp_source = "0.0.0.0/0"
mariadb_security_group_rtp_dst_port_min = "3306"
mariadb_security_group_rtp_dst_port_max = "3306"
mariadb_security_group_rtp_src_port_min = "1024"
mariadb_security_group_rtp_src_port_max = "65534"



# omlapp instance -- omlapp instance -- omlapp instance
# omlapp instance -- omlapp instance -- omlapp instance
omlapp_instance_display_name = "omlapp"
omlapp_instance_shape = "VM.Standard.E2.1"
omlapp_instance_availability_domain = "ZxEZ:SA-SANTIAGO-1-AD-1"
omlapp_user_data = "../user_data/omlapp.tpl"

omlapp_security_group_ssh_source = "0.0.0.0/0"
omlapp_security_group_ssh_dst_port = "22"
omlapp_security_group_ssh_src_port_min = "1024"
omlapp_security_group_ssh_src_port_max = "65534"

omlapp_security_group_rtp_source = "0.0.0.0/0"
omlapp_security_group_rtp_dst_port_min = "5432"
omlapp_security_group_rtp_dst_port_max = "5432"
omlapp_security_group_rtp_src_port_min = "1024"
omlapp_security_group_rtp_src_port_max = "65534"

network_interface = "ens3"
# omlapp_hostname = "tenant.example.com"
oml_release = "release-1.12.0"
ami_user = "omnileadsami"
ami_password = "5_MeO_DMT"
dialer_user = "demoadmin"
dialer_password = "demo"
ecctl = "2880"
pg_database = "omnileads"
pg_username = "omnileads"
pg_password = "admin123"
pg_port = "5432"
pg_database_name = "postgres"
pg_database_user = "postgres"
pg_database_password = "admin123"
sca = "1800"
schedule = "agenda"
extern_ip = "auto"
oml_tz = "America/Argentina/Cordoba"
recording_ramdisk_size = "200"
