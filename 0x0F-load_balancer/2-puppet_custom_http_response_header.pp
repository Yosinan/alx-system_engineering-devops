# this will automate tge previous task i've done( creating custom header for the http response)

exec { 'update':
  command => '/usr/bin/apt-get update',
}
-> package { 'nginx':
  ensure  => 'present',
}

-> file_line { 'cust_http_header':
  path  => '/etc/nginx/nginx.conf',
  line  => "http {\n\tadd_header X-Served-By \"${hostname}\}";",
}

-> exec { 'run':
  
  command => 'usr/sbin/service nginx restart',
}
