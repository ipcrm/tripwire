# == Class tripwire::install
#
# This class is called from tripwire for install.
#
class tripwire::install {

  exec { 'installtripagt':
    cwd       => $::tripwire::install_media_dir,
    path      => [$::tripwire::install_media_dir,'/bin','/usr/bin'],
    command   => "te_agent.bin --eula accept --silent --server-host ${::tripwire::master_host} --server-port ${::tripwire::master_port} --passphrase ${::tripwire::master_passcode} --install-dir ${::tripwire::client_installdir}",
    creates   => "${::tripwire::client_installdir}/bin",
    logoutput => true,
    timeout   => 1800,
  }
}
