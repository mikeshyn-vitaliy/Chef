#
# Cookbook Name:: webserver_wp
# Recipe:: web_user
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
group node['webserver_wp']['group']

user node['webserver_wp']['user'] do
  group node['webserver_wp']['group']
  system true
  shell '/bin/bash'
end