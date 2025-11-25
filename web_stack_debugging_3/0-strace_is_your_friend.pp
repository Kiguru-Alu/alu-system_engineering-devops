# Fix the WordPress installation causing Apache to return 500 errors

exec { 'restore-wp-settings':
  command => 'cp /var/www/html/wp-settings.php.save /var/www/html/wp-settings.php',
  onlyif  => 'test ! -f /var/www/html/wp-settings.php',
}

service { 'apache2':
  ensure => 'running',
  enable => true,
  subscribe => Exec['restore-wp-settings'],
}

