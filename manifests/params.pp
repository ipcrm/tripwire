# == Class tripwire::params
#
# This class is meant to be called from tripwire.
# It sets variables according to platform.
#
class tripwire::params {
  $tw_dir = '/usr/local/tripwire/te/agent/bin/'
  $twservice_start = "${tw_dir} twdaemon start"

  case $::osfamily {
    'RedHat': {
      $package_name = 'tripwire'
      $service_name = 'tripwire'

    }

    default: {
      fail("${::operatingsystem} not supported")

    }
  }
}
