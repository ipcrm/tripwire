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
      $package_name = 'tripwire'
      $service_name = 'tripwire'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
