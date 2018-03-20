# == Class puppet_agent::prepare::patch
#
# Private class called from puppet_agent::post class
#
# This copies over patch patches on upgrade
#
class puppet_agent::post::patch {
  assert_private()

  $patch_dir = "${::puppet_agent::params::local_puppet_dir}/puppet/cache/patch"


  $legacy_patch_dir = '/var/lib/puppet/patch'

  if $::legacy_patch_dir_exists {
    file { $patch_dir:
      ensure             => directory,
      source             => $legacy_patch_dir,
      backup             => false,
      recurse            => true,
      source_permissions => use,
      require            => Package[$puppet_agent::package_name],
    }
  }

}
