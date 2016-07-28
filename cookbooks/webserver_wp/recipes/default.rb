#
# Cookbook Name:: awesome_customers_rhel
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'selinux::permissive'
include_recipe 'webserver_wp::firewall'
include_recipe 'webserver_wp::web_user'
include_recipe 'webserver_wp::web'
include_recipe 'webserver_wp::database'
include_recipe 'webserver_wp::server_info'
include_recipe 'webserver_wp::wp'