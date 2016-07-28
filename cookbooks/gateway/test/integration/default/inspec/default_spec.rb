#BIND
describe package "bind-chroot" do
  it { should be_installed }
end

describe service 'named-chroot' do
  it { should be_enabled }
  it { should be_running }
  end

describe port 53 do
  it { should be_listening }
end

describe file('/etc/named.conf') do
  it { should be_file }
end

describe command('systemctl status named-chroot') do
  its('exit_status') { should eq 0 }
end

#Iptables
describe service 'firewalld' do
  it { should_not be_running }
  it { should_not be_enabled }
end

describe package "iptables-services" do
	it { should be_installed}
end

describe file('/etc/iptables.sh') do
  it { should be_file }
end

describe service 'iptables' do
  it { should be_enabled }
  it { should be_running }
end

#Network
describe service 'NetworkManager' do
  it { should_not be_running }
  it { should_not be_enabled }
end

describe service 'network' do
  it { should be_running }
end

#NTP
describe package 'ntp' do
	it { should be_installed}
end

describe command('systemctl status ntpd') do
  its('exit_status') { should eq 0 }
end

# describe service 'ntpd' do
#  it { should_not be_running }
#  it { should_not be_enabled }
#end

describe file('/etc/ntp.conf') do
  it { should be_file }
end
