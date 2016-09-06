# == Class tripwire::install
#
# This class is called from tripwire for install.
#
class tripwire::install {
  notify { 'This is the install class ':
      message => "This is the install class --server-host ${twserverhost} --server-port ${twport} --passphrase ${twpassphrase} --enable-fips",
    }

}
