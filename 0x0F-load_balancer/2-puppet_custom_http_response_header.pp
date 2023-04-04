# this will automate tge previous task i've done( creating custom header for the http response)
package { 'nginx':
  ensure => installed,
}

header { 'X-Served-By':
  ensure => present,
  value => '${hostname}',
  target => '/etc/nginx/nginx.conf',
}
service { 'nginx':
  ensure => running,
  subscribe => Header['X-Served-By'],
}
