#
# Cookbook Name:: gateway
# Recipe:: firewall
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
service 'firewalld' do
  action [:stop, :disable]
end

execute 'install iptables' do
  user 'root'
  command 'yum -y install iptables-services'
end

template '/etc/iptables.sh' do
  source 'iptables.sh.erb'
  owner 'root'
  group 'root'
  mode '0740'
end

# service 'iptables' do
#  action [:start, :enable]
# end

# execute 'install iptables rules and reload service' do
#  user 'root'
#  command '/etc/iptables.sh'
#  command 'systemctl reload iptables'
# end
