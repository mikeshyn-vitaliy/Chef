#
# Cookbook Name:: jenkins_server
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'java'
include_recipe 'jenkins_server::jenkins'
include_recipe 'selinux::permissive'
include_recipe 'jenkins_server::firewall'