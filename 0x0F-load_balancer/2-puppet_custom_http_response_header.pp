# this will automate tge previous task i've done( creating custom header for the http response)
exec { 'command':
  command => 'apt-get -y update;
  apt-get -y install nginx,
  line => "http {\n\t add_header X-Served-By \"${hostname}\";",
  service nginx restart',
  provider => shell,
}
