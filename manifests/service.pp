# == Class tripwire::service
#
# This class is meant to be called from tripwire.
# It ensure the service is running.
#
class tripwire::service {

  service { $::tripwire::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
