# == Class tripwire::install
#
# This class is called from tripwire for install.
#
class tripwire::install
{

  notify { 'This is the install class':
  message     => "./te_agent.bin --eula accept --silent --server-host ${::tripwire::tripip} --server-port ${::tripwire::twtripport} --passphrase ${::tripwire::pass} --enable-fips",
  #This directory is at ${::tripwire::tripwire_installdir}",
  }

  file {'/tmp/te_agent_8.4.2_en_linux_x86_64/te_agent.bin':
  ensure => 'file',
  owner  => 'root',
  group  => 'root',
  notify => Exec['installtripagt'],
}


  exec { 'installtripagt':
  cwd         => $::tripwire::tripwire_installdir,
  path        => $::tripwire::tripwire_installdir,
  command     => "./te_agent.bin --eula accept --silent --server-host ${::tripwire::tripip} --server-port ${::tripwire::twtripport} --passphrase ${::tripwire::pass} --enable-fips",
  refreshonly => true,


}
}
