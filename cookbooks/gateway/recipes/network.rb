#
# Cookbook Name:: gateway
# Recipe:: network
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
service 'NetworkManager' do
  action [:stop, :disable]
end

service 'network' do
  action [:start]
end

execute 'Network Enable' do
  user 'root'
  command '/sbin/chkconfig network on'
end

network_interface node['gateway']['network']['adapter1']['interface'] do
  bootproto node['gateway']['network']['adapter1']['boot']
  address node['gateway']['network']['adapter1']['address']
  netmask node['gateway']['network']['adapter1']['netmask']
  gateway node['gateway']['network']['adapter1']['gateway']
  dns node['gateway']['network']['adapter1']['dns']
end

network_interface node['gateway']['network']['adapter2']['interface'] do
  bootproto node['gateway']['network']['adapter2']['boot']
  address node['gateway']['network']['adapter2']['address']
  netmask node['gateway']['network']['adapter2']['netmask']
  dns node['gateway']['network']['adapter2']['dns']
end

service 'network' do
  action [:restart]
end
