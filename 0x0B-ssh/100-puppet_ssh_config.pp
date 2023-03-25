# Client configuration file (w/ Puppet)
# this script will set up your client SSH configuration file so that you can connect to a server without typing a password

file_line {  'pwd_no_autentication':
  path => '/etc/ssh/ssh_config',
  line => 'PasswordAuthentication no',
}
file_line {  pwd_direction':
  path => '/etc/ssh/ssh_config',
  line => 'IdentityFile ~/.ssh/school',
}
