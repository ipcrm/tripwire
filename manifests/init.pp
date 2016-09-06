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
  String $twip,
  Integer[0, 65535] $twtripport,
  String $pass,
  String $tripwire_installdir,
)  {

  # validate parameters here

  class { '::tripwire::install':
  $twip => $twip} ->
  class {'::tripwire::config':} ~>
  class {'::tripwire::service':} ->
  Class['::tripwire']
}
