#
# Cookbook Name:: webserver_wp
# Recipe:: web
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
httpd_service 'wordpress' do
  mpm 'prefork'
  action [:create, :start]
end

# Add the site configuration.
httpd_config 'wordpress' do
  instance 'wordpress'
  source 'wordpress.conf.erb'
  notifies :restart, 'httpd_service[wordpress]'
end

# Create the document root directory.
#directory node['webserver_wp']['document_root'] do
#  recursive true
#end
directory node['webserver_wp']['document_root'] do
  owner node['webserver_wp']['user']
  group node['webserver_wp']['group']
  mode "0755"
  action :create
  recursive true
end

# Install the mod_php Apache module.
httpd_module 'php' do
  instance 'wordpress'
end

# Install php-mysql.
package 'php-mysql' do
  action :install
  notifies :restart, 'httpd_service[wordpress]'
end