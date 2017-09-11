#
# Cookbook Name:: windows-failover-cluster-feature-install
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

################ Windows Failover Cluster Configuration ####################
=begin
powershell_script 'windows-failover-cluster-feature-install' do
  code <<-EOH
  $instancePvtIP = ( Invoke-WebRequest ` -Uri http://169.254.169.254/latest/meta-data/local-ipv4 ).Content
  $GatewayIP = (Get-WmiObject -Class Win32_IP4RouteTable | where { $_.destination -eq '0.0.0.0' -and $_.mask -eq '0.0.0.0'} | Sort-Object metric1 | select nexthop, metric1, interfaceindex).nexthop
  Netsh int ipv4 add address "Ethernet" address=$instancePvtIP mask='#{node['windows-failover-cluster-feature-install']['ServerSubnetMask']}' gateway=$GatewayIP
  Install-WindowsFeature -Name Failover-Clustering -IncludeManagementTools
  Restart-Computer
  EOH
  domain node['windows-failover-cluster-feature-install']['DomainName']
  user node['windows-failover-cluster-feature-install']['DomainUserName']
  password node['windows-failover-cluster-feature-install']['DomainUserPassword']
end
=end

Chef::ReservedNames::Win32::Security.add_account_right( 'Administrators', 'SeAssignPrimaryTokenPrivilege')
Chef::ReservedNames::Win32::Security.add_account_right(node['windows-failover-cluster-feature-install']['DomainUserName'], 'SeAssignPrimaryTokenPrivilege')

powershell_script 'windows-failover-cluster' do
  code <<-EOH
  Install-WindowsFeature -Name Failover-Clustering -IncludeManagementTools
  EOH
end


powershell_script 'Restart-Computer' do
  code <<-EOH
  Restart-Computer
  EOH
end