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
      $tw_dir = '/usr/local/tripwire/te/agent/bin/'
      $twservice_start = "${tw_dir} twdaemon start"
    }
    'RedHat', 'Amazon': {

      $tw_dir = '/usr/local/tripwire/te/agent/bin/'
      $twservice_start = "${tw_dir} twdaemon start"

    }
    default: {
      fail("${::operatingsystem} not supported")
      $tw_dir = '/usr/local/tripwire/te/agent/bin/'
      $twservice_start = "${tw_dir} twdaemon start"
    }
  }
}
