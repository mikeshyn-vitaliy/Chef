#
# Cookbook Name:: webserver_wp
# Recipe:: wp
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
wordpress_latest = Chef::Config[:file_cache_path] + "/wordpress-latest.tar.gz"

remote_file wordpress_latest do
  source "http://wordpress.org/latest.tar.gz"
  mode "0644"
end

execute "untar-wordpress" do
  cwd node['webserver_wp']['document_root']
  command "tar --strip-components 1 -xzf " + wordpress_latest
  creates node['webserver_wp']['document_root'] + "/wp-settings.php"
end

wp_secrets = Chef::Config[:file_cache_path] + '/wp-secrets.php'

if File.exist?(wp_secrets)
  salt_data = File.read(wp_secrets)
else
  require 'open-uri'
  salt_data = open('https://api.wordpress.org/secret-key/1.1/salt/').read
  open(wp_secrets, 'wb') do |file|
    file << salt_data
  end
end

# Write the home page.
template "#{node['webserver_wp']['document_root']}/wp-config.php" do
 source 'wp-config.php.erb'
 mode '0644'
 owner node['webserver_wp']['user']
 group node['webserver_wp']['group']
end