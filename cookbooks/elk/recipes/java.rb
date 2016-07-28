#
# Cookbook Name:: elk
# Recipe:: java
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
bash 'install_java' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
  curl -v -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u101-b13/jdk-8u101-linux-x64.rpm > jdk-8u101-linux-x64.rpm
  rpm -ivh jdk-8u101-linux-x64.rpm
  EOH
  not_if { ::File.exists?("/usr/java") }
end

