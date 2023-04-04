# this will automate tge previous task i've done( creating custom header for the http response)
exec { 'update':
  command => '/usr/bin/env apt-get update -y',
}
-> package { 'nginx':
  ensure  => installed,
  require => Exec['update'],
}
# the header
-> file_line { 'cust_header':
  ensure  => 'present',
  path    => '/etc/nginx/sites-available/default',
  after   => 'server_name _:',
 # target => '/etc/nginx/nginx.conf',
  line    => "http \n\t add_header X-Served-By \"${hostname}\";",
  require => package['nginx'],
}
-> file { '/var/www/html/index.html':
  content => 'Hello World!',
}
-> service { 'nginx':
  ensure  => running,
  require => File_line['cust_header'],
  command => 'usr/sbin/ service nginx restart',}
}
