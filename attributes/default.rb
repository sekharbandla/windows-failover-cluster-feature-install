#
# Cookbook Name:: WCFC
# Author:: pavankumar.amballa@reancloud.com

# This is a Chef attributes file. It can be used to specify default and override
# attributes to be applied to nodes that run this cookbook.

# Package uri for dnow

#Change the default admin email
#default["windows-failover-cluster-feature-install"]["secondaryIP"]  = '10.0.25.24'
#default["windows-failover-cluster-feature-install"]["NewClusterName"]  = 'cluster10'
default["windows-failover-cluster-feature-install"]["DomainUserName"]  = 'opis\administrator'
#default["windows-failover-cluster-feature-install"]["DomainUserPassword"]  = 'reanadmin@123'
#default["windows-failover-cluster-feature-install"]["ServerSubnetMask"]  = '255.255.248.0'
#default["windows-failover-cluster-feature-install"]["DomainName"]  = 'opis.internal'
#default["windows-failover-cluster-feature-install"]["DomainServerIP"]  = '10.0.25.152'

