#
# Cookbook Name:: gateway
# Recipe:: ntp
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
package node['ntp']['package'] do
  action :install
end

service node['ntp']['service'] do
  action :start
end

template '/etc/ntp.conf' do
  source 'ntp.conf.erb'
  owner 'root'
  group 'root'
  mode 0644
  notifies :restart, resources(:service => node['ntp']['service'])
end
