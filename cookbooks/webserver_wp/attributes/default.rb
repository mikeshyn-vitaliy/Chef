def random_password
  require 'securerandom'
  SecureRandom.base64
end

default['firewall']['allow_ssh'] = true
default['firewall']['firewalld']['permanent'] = true
default['webserver_wp']['open_ports'] = 80

default['webserver_wp']['user'] = 'web_admin'
default['webserver_wp']['group'] = 'web_admin'
default['webserver_wp']['document_root'] = '/var/www/wordpress/public_html'

default_unless['webserver_wp']['database']['root_password'] = random_password
default_unless['webserver_wp']['database']['admin_password'] = random_password

default['webserver_wp']['database']['dbname'] = 'wp_db'
default['webserver_wp']['database']['host'] = '127.0.0.1'
default['webserver_wp']['database']['root_username'] = 'root'
default['webserver_wp']['database']['admin_username'] = 'db_admin'