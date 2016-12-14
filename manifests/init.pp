# Class: tripwire
# ===========================
#
# Initializes Tripwire module based on four required parameters
#
# Parameters
# ----------
# [master_host]
#  This is the hostname/IP address of the tripwire master server to connect to.
# [master_port]
#  This is the port number required to connect to the tripwire master server port.
# [master_passcode]
#  This is the passcode the tripwire master server expects in order to create a secure connection.
# [client_installdir]
#  This required parameter will instruct Puppet where to install this module on the client OS.

class tripwire (

  String $master_host,
  Integer[0, 65535] $master_port,
  String $master_passcode,
  String $client_installdir,
) {
  # validate parameters here
  class {'::tripwire::install':} ->
  class {'::tripwire::config':} ~>
  class {'::tripwire::service':} ->
  Class['::tripwire']
}
