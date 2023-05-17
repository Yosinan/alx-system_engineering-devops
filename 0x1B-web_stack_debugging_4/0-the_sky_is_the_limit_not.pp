# fix the issue wiz nginx 
exec { 'increase limit':
  command => '/usr/bin/env sed -i s/15/50000/ /etc/default/nginx',
} ->
exec { 'restart nginx':
  provider => shell,
  command  => '/usr/bin/env service nginx restart'
}
