# NTP
default['ntp']['package'] = 'ntp'
default['ntp']['service'] = 'ntpd'
default['ntp']['is_server'] = false
default['ntp']['servers'] = ['0.ua.pool.ntp.org', '1.ua.pool.ntp.org', '2.ua.pool.ntp.org', '3.ua.pool.ntp.org']

# network
default['gateway']['network']['adapter1']['interface'] = 'enp0s8'
default['gateway']['network']['adapter1']['boot'] = 'none'
default['gateway']['network']['adapter1']['address'] = '172.16.3.10'
default['gateway']['network']['adapter1']['netmask'] = '255.255.255.0'
default['gateway']['network']['adapter1']['gateway'] = '172.16.3.1'
default['gateway']['network']['adapter1']['dns'] = '62.80.160.130'

default['gateway']['network']['adapter2']['interface'] = 'enp0s9'
default['gateway']['network']['adapter2']['boot'] = 'none'
default['gateway']['network']['adapter2']['address'] = '192.168.2.2'
default['gateway']['network']['adapter2']['netmask'] = '255.255.255.0'
default['gateway']['network']['adapter2']['gateway'] = 
default['gateway']['network']['adapter2']['dns'] = '62.80.160.140'

# hostname & domain
default['gateway']['domain'] = 'home.ua'
default['gateway']['hostname'] = 'node01fw'

# locale
default['gateway']['lacale'] = 'Europe/Kiev'
