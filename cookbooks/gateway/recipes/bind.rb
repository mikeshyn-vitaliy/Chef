#
# Cookbook Name:: gateway
# Recipe:: bind
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
execute 'install BIND' do
  user 'root'
  command 'yum -y install bind bind-utils bind-chroot'
end

service 'named-chroot' do
  action [:start, :enable]
end

template '/etc/named.conf' do
  source 'named.conf.erb'
  owner 'root'
  group 'named'
  mode '0644'
end

template '/var/named/chroot/var/named/2.168.192.db' do
  source '2.168.192.db.erb'
  owner 'root'
  group 'named'
  mode '0640'
end

template '/var/named/chroot/var/named/home.ua.zone' do
  source 'home.ua.zone.erb'
  owner 'root'
  group 'named'
  mode '0640'
end

execute 'Reload Bind zone config; create log folders; reload service' do
  user 'root'
  command 'rndc reconfig'
  command 'cd /var/named/chroot/var/log && mkdir named && chown named. named'
  command 'systemctl restart named-chroot'
end
