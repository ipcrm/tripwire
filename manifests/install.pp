# == Class tripwire::install
#
# This class is called from tripwire for install.
#
class tripwire::install {

  package { $::tripwire::package_name:
    ensure => present,
  }
}
