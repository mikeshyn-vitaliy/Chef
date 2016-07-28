#
# Cookbook Name:: gateway
# Recipe:: sysctl
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
node.default['sysctl']['params']['net']['ipv4']['ip_forward'] = 1

include_recipe 'sysctl::apply'
