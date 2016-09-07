# == Class tripwire::install
#
# This class is called from tripwire for install.
#
class tripwire::install
{

  #This directory is at ${::tripwire::tripwire_installdir}",


  file {'/tmp/te_agent_8.4.2_en_linux_x86_64/te_agent.bin':
  ensure => 'file',
  owner  => 'root',
  group  => 'root',
  #notify => Exec['installtripagt'],
}


#notify { 'This is the init class ':
#  message => $::tripwire::tripwire_installdir,
#  }
  exec { 'installtripagt':
  cwd       => '/tmp',
  path      => $::tripwire::tripwire_installdir,'/bin'
  command   => "te_agent.bin --eula accept --silent --server-host ${::tripwire::twip} --server-port ${::tripwire::twtripport} --passphrase ${::tripwire::pass} --enable-fips",
  require   => File['/tmp/te_agent_8.4.2_en_linux_x86_64/te_agent.bin'],
  creates   => '/usr/local/tripwire/te/agent/bin/',
  logoutput => true,



}
}
