# == Class puppet_agent::prepare::concat
#
# Private class called from puppet_agent::prepare class
#
# This copies over concat fragments on update
#
class puppet_agent::prepare::concat {
  assert_private()

  $concat_dir = "${::puppet_agent::params::local_puppet_dir}/puppet/cache/concat"

  if $::concat_basedir {
    file { $concat_dir:
      ensure  => directory,
      source  => $::concat_basedir,
      backup  => false,
      recurse => true,
    }
  }

}
