# == Class tripwire::install
#
# This class is called from tripwire for install.
#
class tripwire::install {

  $tw_dir = '/usr/local/tripwire/te/agent/bin/'
  $twservice_start = "${tw_dir} twdaemon start"
  $twip = hiera('twserverhost')
  $twtripport = hiera('twport')
  $pass = hiera('twpassphrase')



}
