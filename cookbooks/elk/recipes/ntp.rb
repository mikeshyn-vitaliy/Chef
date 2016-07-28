#
# Cookbook Name:: elk
# Recipe:: ntp
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
bash 'yum-update & install curl' do
  user 'root'
  code <<-EOH
  yum -y update
  yum -y install curl
  EOH
  not_if { ::File.exists?("/usr/bin/curl") }
end

package node['ntp']['package'] do
  action [:install]
end

template '/etc/ntp.conf' do
  source 'ntp.conf.erb'
  owner 'root'
  group 'root'
  mode 0644
end

service node['ntp']['service'] do
  action [:start, :enable]
end
