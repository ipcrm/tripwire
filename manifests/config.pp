# == Class tripwire::config
#
# This class is called from tripwire for service config.
#
class tripwire::config {

  file { '/etc/init.d/twdaemon':
    ensure => 'file',
    mode   => '0755',
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/tripwire/twdaemon',
}

file { '/etc/rc.d/init.d/twdaemon':
  ensure => 'file',
  mode   => '0755',
  owner  => 'root',
  group  => 'root',
  source => 'puppet:///modules/tripwire/twdaemon',
}
}
