# Fix the WordPress installation causing Apache to return 500 errors

package { 'apache2':
  ensure => installed,
}

exec { 'restore-wp-settings':
  command => 'cp /var/www/html/wp-settings.php.save /var/www/html/wp-settings.php',
  refreshonly => false,
}

service { 'apache2':
  ensure  => running,
  enable  => true,
  require => Package['apache2'],
  subscribe => Exec['restore-wp-settings'],
}

