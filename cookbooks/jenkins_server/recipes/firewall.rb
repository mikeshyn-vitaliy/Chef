#
# Cookbook Name:: jenkins_server
# Recipe:: firewall
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'firewall::default'

ports = node['jenkins_server']['open_80']
firewall_rule "open ports #{ports}" do
  port ports
end

ports = node['jenkins_server']['open_8080']
firewall_rule "open ports #{ports}" do
  port ports
end

ports = node['jenkins_server']['open_443']
firewall_rule "open ports #{ports}" do
  port ports
end

ports = node['jenkins_server']['open_8009']
firewall_rule "open ports #{ports}" do
  port ports
end

firewall 'default' do
  action :save
end
