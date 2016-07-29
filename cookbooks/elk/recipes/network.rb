#
# Cookbook Name:: elk
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

network_interface node['elk']['network']['adapter1']['interface'] do
  bootproto node['elk']['network']['adapter1']['boot']
  address node['elk']['network']['adapter1']['address']
  netmask node['elk']['network']['adapter1']['netmask']
  gateway node['elk']['network']['adapter1']['gateway']
  dns node['elk']['network']['adapter1']['dns']
end
