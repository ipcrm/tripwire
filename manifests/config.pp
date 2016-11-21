# == Class tripwire::config
#
# This class is called from tripwire for service config.
#
class tripwire::config {

  file { '/etc/init.d/twdaemon':
    ensure  => 'file',
    mode    => '0755',
    owner   => 'root',
    group   => 'root',
    content => epp(
      'tripwire/twdaemon.epp',
      {
        client_installdir => $::tripwire::client_installdir
      }
    ),
  }

  file { '/etc/rc.d/init.d/twdaemon':
    ensure  => 'file',
    mode    => '0755',
    owner   => 'root',
    group   => 'root',
    content => epp(
      'tripwire/twdaemon.epp',
      {
        client_installdir => $::tripwire::client_installdir
      }
    ),
  }
}
