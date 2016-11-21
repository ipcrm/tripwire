# == Class tripwire::install
#
# This class is called from tripwire for install.
#
class tripwire::install {

  file { "${::tripwire::client_installdir}/te_agent_8.4.2_en_linux_x86_64/te_agent.bin" :
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    before => Exec['installtripagt'],
  }

  exec { 'installtripagt':
    cwd       => "${::tripwire::client_installdir}/te_agent_8.4.2_en_linux_x86_64/",
    path      => ["${::tripwire::client_installdir}/te_agent_8.4.2_en_linux_x86_64",'/bin','/usr/bin'],
    command   => "te_agent.bin --eula accept --silent --server-host ${::tripwire::master_host} --server-port ${::tripwire::master_port} --passphrase ${::tripwire::master_passcode} --enable-fips",
    creates   => "${::tripwire::client_installdir}/tripwire/te/agent/bin/",
    logoutput => true,
    timeout   => 1800,
  }
}
