#!/bin/bash

sed -i 's/^SELINUX=.*/SELINUX=disabled/' /etc/sysconfig/selinux
sed -i 's/^SELINUX=.*/SELINUX=disabled/' /etc/selinux/config
systemctl disable firewalld

yum update -y
rpm -Uvh https://yum.postgresql.org/11/redhat/rhel-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
yum install -y postgresql11-server postgresql11 postgresql11-plperl postgresql11-contrib postgresql11-odbc vim

/usr/pgsql-11/bin/postgresql-11-setup initdb

#/var/lib/pgsql/11/data/postgresql.conf

systemctl enable postgresql-11 && systemctl start postgresql-11

reboot
