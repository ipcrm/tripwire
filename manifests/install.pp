# == Class tripwire::install
#
# This class is called from tripwire for install.
#
class tripwire::install {
  notify { 'This is the install class ':
      message => "This is the install class --server-host ${twserverhost} --server-port ${twport} --passphrase ${twpassphrase} --enable-fips",
    }

  #  file {'/tmp/':
  #      ensure => 'directory',
  #      owner  => 'root',
  #      group  => 'root',
  #    }

  #    file{'/tmp/te_agent_8.4.2_en_linux_x86_64.tgz':
  #      ensure => file,
  #      mode   => '0644',
  #      source => 'puppet:///modules/tripwire/te_agent_8.4.2_en_linux_x86_64.tgz',
  #      notify => Exec['unpack tripwire'],
  #    }

  #    exec { 'unpack tripwire':
  #      cwd         => '/tmp',
        #path        => '/tmp/tripwire',
  #      command     => '/bin/tar xvf te_agent_8.4.2_en_linux_x86_64.tgz',
  #      refreshonly => true,
  #    }


}
