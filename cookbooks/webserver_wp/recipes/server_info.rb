#
# Cookbook Name:: webserver_wp
# Recipe:: server_info
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
template '/etc/motd' do
  source 'server-info.erb'
  mode '0644'
end