# this will automate tge previous task i've done( creating custom header for the http response)
exec { 'update':
  command => '/usr/bin/apt-get update -y',
}
-> package { 'nginx':
  ensure  => 'present',
}
# the header
-> file_line { 'cust_header':
  target => '/etc/nginx/nginx.conf',
  line   => "http {\n\tadd_header X-Served-By \"${hostname}\";",
}
-> exec { 'run':
  #require => File_line['cust_header'],
  command => 'usr/sbin/service nginx restart',
}
