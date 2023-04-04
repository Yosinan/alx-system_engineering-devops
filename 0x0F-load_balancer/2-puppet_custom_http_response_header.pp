# this will automate tge previous task i've done( creating custom header for the http response)
package { 'nginx':
  ensure => installed,
}
package { 'nginx':
  ensure => 'present',
}

header { 'cust_header':
  ensure => 'present',
  value => '${hostname}',
  target => '/etc/nginx/nginx.conf',
  line => "http {\n\t add_header X-Served-By \"${hostname}\";",
}

exec { 'execute':
  command => 'usr/sbin/ service nginx restart',
}
