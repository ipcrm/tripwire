# == Class tripwire::service
#
# This class is meant to be called from tripwire.
# It ensure the service is running.
#
class tripwire::service {

  service { 'twdaemon':
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
  }
}
