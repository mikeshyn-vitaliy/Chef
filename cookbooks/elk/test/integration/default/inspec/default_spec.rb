#curl
describe package 'curl' do
  it { should be_installed }
end

#NTP
describe package 'ntp' do
  it { should be_installed }
end

describe systemd_service('ntpd') do
  it { should be_installed }
end

describe systemd_service('ntpd') do
  it { should be_running }
end

describe systemd_service('ntpd') do
  it { should be_enabled }
end

describe file('/etc/ntp.conf') do
  it { should be_file }
end

#Iptables
describe service 'firewalld' do
  it { should_not be_running }
  it { should_not be_enabled }
end

describe package "iptables-services" do
  it { should be_installed }
end

describe file('/etc/iptables.sh') do
  it { should be_file }
end

describe systemd_service('iptables') do
  it { should be_installed }
end

describe systemd_service('iptables') do
  it { should be_running }
end

describe systemd_service('iptables') do
  it { should be_enabled }
end

#Java
describe package "java" do
  it { should be_installed }
end

describe file('/usr/java') do
 it { should exist }
end

#ELK
describe systemd_service('elasticsearch') do
  it { should be_installed }
end

describe systemd_service('elasticsearch') do
  it { should be_running }
end

describe systemd_service('elasticsearch') do
  it { should be_enabled }
end

describe file('/etc/elasticsearch/elasticsearch.yml') do
  it { should be_file }
end

describe systemd_service('kibana') do
  it { should be_installed }
end

describe systemd_service('kibana') do
  it { should be_running }
end

describe systemd_service('kibana') do
  it { should be_enabled }
end

describe file('/opt/kibana/config/kibana.yml') do
  it { should be_file }
end

describe file('/etc/nginx/nginx.conf') do
  it { should be_file }
end

describe file('/etc/nginx/conf.d/kibana.conf') do
  it { should be_file }
end

describe systemd_service('nginx') do
  it { should be_installed }
end

describe systemd_service('nginx') do
  it { should be_running }
end

describe systemd_service('nginx') do
  it { should be_enabled }
end

describe systemd_service('logstash') do
  it { should be_installed }
end

describe command('systemctl status logstash') do
  its('exit_status') { should eq 0 }
end

describe sysv_service('logstash') do
  it { should be_running }
end

describe sysv_service('logstash') do
  it { should be_enabled }
end

describe file('/etc/pki/tls/private/logstash-forwarder.key') do
  it { should be_file }
end

describe file('/etc/pki/tls/certs/logstash-forwarder.crt') do
  it { should be_file }
end

describe file('/etc/logstash/conf.d/02-beats-input.conf') do
  it { should be_file }
end

describe file('/etc/logstash/conf.d/10-syslog-filter.conf') do
  it { should be_file }
end

describe file('/etc/logstash/conf.d/30-elasticsearch-output.conf') do
  it { should be_file }
end

describe package "unzip" do
  it { should be_installed }
end

#Network
describe service 'NetworkManager' do
  it { should_not be_running }
  it { should_not be_enabled }
end

describe sysv_service('network') do
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
  its('protocols') {should eq ['tcp']}
end

describe port(123) do
  it { should be_listening }
  its('protocols') {should eq ['udp']}
end

describe port(5044) do
  it { should be_listening }
  its('protocols') {should eq ['tcp']}
end

describe port(5601) do
  it { should be_listening }
  its('protocols') {should eq ['tcp']}
end

describe port(9200) do
  it { should be_listening }
  its('protocols') {should eq ['tcp']}
end