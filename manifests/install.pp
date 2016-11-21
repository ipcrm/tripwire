# == Class tripwire::install
#
# This class is called from tripwire for install.
#
class tripwire::install {

  #This directory is at ${::tripwire::tripwire_installdir}",

  file { "${::twdir}/te_agent_8.4.2_en_linux_x86_64/te_agent.bin" :
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    before => Exec['installtripagt'],
  }

  exec { 'installtripagt':
    cwd       => "${::twdir}/te_agent_8.4.2_en_linux_x86_64/",
    path      => ['$twdir','/bin','/usr/bin'],
    command   => "te_agent.bin --eula accept --silent --server-host ${::tripwire::twip} --server-port ${::tripwire::twtripport} --passphrase ${::tripwire::pass} --enable-fips",
    creates   => "${::twdir}/tripwire/te/agent/bin/",
    logoutput => true,
    timeout   => 1800,
  }
}
