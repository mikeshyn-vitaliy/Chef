# NTP
default['ntp']['package'] = 'ntp'
default['ntp']['service'] = 'ntpd'
default['ntp']['is_server'] = false
default['ntp']['servers'] = ['0.ua.pool.ntp.org', '1.ua.pool.ntp.org', '2.ua.pool.ntp.org', '3.ua.pool.ntp.org']

# network
default['elk']['network']['adapter1']['interface'] = 'eno16777984'
default['elk']['network']['adapter1']['boot'] = 'none'
default['elk']['network']['adapter1']['address'] = '192.168.22.99'
default['elk']['network']['adapter1']['netmask'] = '255.255.255.0'
default['elk']['network']['adapter1']['gateway'] = '192.168.22.1'
default['elk']['network']['adapter1']['dns'] = '192.168.22.1'

# hostname & domain
default['elk']['domain'] = 'home.ua'
default['elk']['hostname'] = 'node01elk'

# locale
default['elk']['lacale'] = 'Europe/Kiev'
