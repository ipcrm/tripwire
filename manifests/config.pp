# == Class tripwire::config
#
# This class is called from tripwire for service config.
#
class tripwire::config {
  if $::operatingsystemmarelease =~ /^6.*/ {

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

elseif $::operatingsystemmarelease =~ /^7.*/ {

  file { '/etc/systemd/system/twdaemon':
    ensure  => 'file',
    mode    => '0755',
    owner   => 'root',
    group   => 'root',
    content => epp(
      'tripwire/sysdtwdaemon.epp',
      {
        client_installdir => $::tripwire::client_installdir
      }
    ),
  }

#  file { '/etc/rc.d/init.d/twdaemon':
#    ensure  => 'file',
#    mode    => '0755',
#    owner   => 'root',
#    group   => 'root',
#    content => epp(
#      'tripwire/sysdtwdaemon.epp',
#      {
#        client_installdir => $::tripwire::client_installdir
#      }
#    ),
#  }
}


}
