#
# Cookbook Name:: elk
# Recipe:: elk
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
bash 'install_elasticsearch' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
  curl -O https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/rpm/elasticsearch/2.3.4/elasticsearch-2.3.4.rpm
  rpm -ivh elasticsearch-2.3.4.rpm
  rm -f elasticsearch-2.3.4.rpm
  EOH
  not_if { ::File.exists?("/etc/elasticsearch/elasticsearch.yml") }
end

template '/etc/elasticsearch/elasticsearch.yml' do
  source 'elasticsearch.yml.erb'
  owner 'root'
  group 'elasticsearch'
  mode '0750'
end

service 'elasticsearch' do
  action [:start, :enable]
end

bash 'install_kibana' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
  curl -O https://download.elastic.co/kibana/kibana/kibana-4.5.3-1.x86_64.rpm
  rpm -ivh kibana-4.5.3-1.x86_64.rpm
  rm -f kibana-4.5.3-1.x86_64.rpm
  EOH
  not_if { ::File.exists?("/opt/kibana/config/kibana.yml") }
end 

template '/opt/kibana/config/kibana.yml' do
  source 'kibana.yml.erb'
  owner 'root'
  group 'root'
  mode '0664'
end

service 'kibana' do
  action [:start, :enable]
end

bash 'install epel-release and nginx' do
  user 'root'
  code <<-EOH
  yum -y install epel-release
  yum -y install nginx httpd-tools
  htpasswd -cdb /etc/nginx/htpasswd.users kibanaadmin Qwerty123
  EOH
  not_if { ::File.exists?("/etc/nginx/nginx.conf") }
end 

template '/etc/nginx/nginx.conf' do
  source 'nginx.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

template '/etc/nginx/conf.d/kibana.conf' do
  source 'kibana.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

service 'nginx' do
  action [:start, :enable]
end

bash 'install_logstash' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
  curl -O https://download.elastic.co/logstash/logstash/packages/centos/logstash-2.3.4-1.noarch.rpm
  rpm -ivh logstash-2.3.4-1.noarch.rpm
  rm -f logstash-2.3.4-1.noarch.rpm
  EOH
  not_if { ::File.exists?("/etc/logstash") }
end

execute 'generate ssl cert' do
  user 'root'
  command "openssl req -subj '/CN=node01elk.home.ua/' -x509 -days 3650 -batch -nodes -newkey rsa:2048 -keyout /etc/pki/tls/private/logstash-forwarder.key -out /etc/pki/tls/certs/logstash-forwarder.crt"
end

template '/etc/logstash/conf.d/02-beats-input.conf' do
  source '02-beats-input.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

template '/etc/logstash/conf.d/10-syslog-filter.conf' do
  source '10-syslog-filter.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

template '/etc/logstash/conf.d/30-elasticsearch-output.conf' do
  source '30-elasticsearch-output.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

bash 'enable logstash' do
  user 'root'
  code <<-EOH
  systemctl start logstash 
  /sbin/chkconfig logstash on
  EOH
end

bash 'install kibana dash' do
  user 'root'
  code <<-EOH
  cd ~
  yum -y install unzip
  curl -L -O https://download.elastic.co/beats/dashboards/beats-dashboards-1.1.0.zip
  unzip beats-dashboards-*.zip
  cd beats-dashboards-*
  ./load.sh
  rm -f beats-dashboards-*.zip
  EOH
end

bash 'install kiba' do
  user 'root'
  code <<-EOH
  cd ~
  curl -O https://gist.githubusercontent.com/thisismitch/3429023e8438cc25b86c/raw/d8c479e2a1adcea8b1fe86570e42abab0f10f364/filebeat-index-template.json
  curl -XPUT 'http://localhost:9200/_template/filebeat?pretty' -d@filebeat-index-template.json
  EOH
end