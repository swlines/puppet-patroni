# Install Patroni packages
class patroni::install inherits patroni {
  case $::osfamily {
    'Debian': {
      case $::lsbdistcodename {
        'stretch': {
          apt::source { 'testing':
            location => 'http://deb.debian.org/debian',
            release => 'testing',
            repos => 'main',
            pin => 1
          }

          apt::pin { 'patroni_testing':
            packages => 'patroni',
            priority => 500,
            release => 'testing'
          }
        }
      }
    }
  }

  package { $::patroni::packagename:
    ensure => $::patroni::ensure_package,
  }
}
