# this will automate tge previous task i've done( creating custom header for the http response)

exec { 'update':
  command => 'sudo apt-get -y update',
}

package { 'nginx':
  ensure  => 'present',
  require => Exec['update'],
}

file_line { '404':
  ensure  => 'present',
  path    => '/etc/nginx/sites-enabled/default',
  after   => 'listen 80 default_server;',
  line    => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
  require => Package['nginx'],
}

file_line { 'add_header':
  ensure  => 'present',
  path    => '/etc/nginx/sites-enabled/default',
  after   => 'listen80 default_server;',
  line    => 'add_header X-Served-By $hostname;',
  require => Package['nginx'],
}

file { '/var/www/html/index.html':
  content => 'Holberton School',
  require => Package['nginx'],
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
