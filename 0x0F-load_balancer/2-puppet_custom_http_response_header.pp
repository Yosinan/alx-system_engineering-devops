# this will automate tge previous task i've done( creating custom header for the http response)
exec { 'update':
  command => '/usr/bin/env apt-get update -y',
}

package { 'nginx':
  ensure => installed,
  require => Exec['update'],
}

# the header

file_line { 'cust_header':
  path => '/etc/nginx/sites-available/default',
  ensure => 'present',
  after => 'serrver_name _:',
 # target => '/etc/nginx/nginx.conf',
  line => "\t add_header X-Served-By ${hostname};",
  require => package['nginx'],
}
service { 'run':
  ensure => running,
  require => File_line['cust_header'],
  command => 'usr/sbin/ service nginx restart',}
}
