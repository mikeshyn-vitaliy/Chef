#
# Cookbook Name:: gateway
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'gateway::sysctl'
include_recipe 'selinux::disabled'
include_recipe 'gateway::ntp'
include_recipe 'gateway::network'
include_recipe 'gateway::bind'
include_recipe 'gateway::firewall'

execute 'set locale' do
  user 'root'
  command 'mv /etc/localtime /etc/localtime.bak'
  command "cp /usr/share/zoneinfo/#{node['gateway']['lacale']} /etc/localtime"
end

# hostname&file hosts
execute 'set hostname in system' do
  user 'root'
  command "sudo hostname #{node['gateway']['hostname']}.#{node['gateway']['domain']}"
end

execute 'set hostname in hostname file' do
  user 'root'
  command "echo #{node['gateway']['hostname']}.#{node['gateway']['domain']} > /etc/hostname"
end

template '/etc/hosts' do
  source 'hosts.erb'
  owner 'root'
  group 'root'
  mode '0644'
end
