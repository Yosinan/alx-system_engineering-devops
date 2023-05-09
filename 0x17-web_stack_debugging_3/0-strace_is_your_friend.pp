# Fix the issue of Apache returning a 500 error

exec { 'solve-wordpress':
  command => 'sed -i s/phpp/php/g /var/www/html/wp-settings.php',
  provider => shell,
}
