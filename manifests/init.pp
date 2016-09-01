# Class: tripwire
# ===========================
#
# Full description of class tripwire here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class tripwire (
  $package_name = $::tripwire::params::$tw_dir,
  $service_name = $::tripwire::params::service_name,
  $twip = hiera('twserverhost'),
  $twtripport = hiera('twport'),
  $pass = hiera('twpassphrase'),
) inherits ::tripwire::params {

  # validate parameters here

  class { '::tripwire::install': } ->
  class { '::tripwire::config': } ~>
  class { '::tripwire::service': } ->
  Class['::tripwire']
}
