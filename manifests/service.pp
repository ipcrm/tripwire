# == Class tripwire::service
#
# This class is meant to be called from tripwire.
# It ensure the service is running.
#
class tripwire::service {

  service { 'twdaemon':
    ensure     => running,
    start      => "/usr/local/tripwire/te/agent/bin/twdaemon" start,
    stop       => "/usr/local/tripwire/te/agent/bin/twdaemon" stop,
    hasstatus  => true,
    hasrestart => true,
  }
}
