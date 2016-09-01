# == Class tripwire::params
#
# This class is meant to be called from tripwire.
# It sets variables according to platform.
#
class tripwire::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'tripwire'
      $service_name = 'tripwire'
    }
    'RedHat', 'Amazon': {
      $tw_dir = '/usr/local/tripwire/te/agent/bin/'
      $service_name = "${tw_dir} twdaemon"
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
