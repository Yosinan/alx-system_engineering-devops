# this will automate tge previous task i've done( creating custom header for the http response)

exec { 'update':
  command => 'sudo apt-get -y update',
}
-> package { 'nginx':
  ensure  => 'present',
}
-> exec { 'nginx install':
  provider => shell,
  command => 'sudo apt-get install nginx -y',
}
-> exec { 'add_header':
  path  => '/etc/nginx/nginx.conf',
  command  => 'sudo sed -i "s/include \/etc\/nginx\/sites-enabled\/\*;/include \/etc\/nginx\/sites-enabled\/\*;\n\tadd_header X-Served-By \"$hostname\";/" /etc/nginx/nginx.conf',
}

-> exec { 'run':
  
  command => 'sudo service nginx restart',
}
