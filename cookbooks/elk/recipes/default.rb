#
# Cookbook Name:: elk
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'selinux::disabled'
include_recipe 'elk::ntp'
include_recipe 'elk::firewall'
include_recipe 'elk::java'
include_recipe 'elk::elk'
include_recipe 'elk::network'

execute 'set locale' do
  user 'root'
  command 'mv /etc/localtime /etc/localtime.bak'
  command "cp /usr/share/zoneinfo/#{node['elk']['lacale']} /etc/localtime"
end

# hostname&file hosts
execute 'set hostname in system' do
  user 'root'
  command "hostname #{node['elk']['hostname']}.#{node['elk']['domain']}"
end

execute 'set hostname in hostname file' do
  user 'root'
  command "echo #{node['elk']['hostname']}.#{node['elk']['domain']} > /etc/hostname"
end

template '/etc/hosts' do
  source 'hosts.erb'
  owner 'root'
  group 'root'
  mode '0644'
end