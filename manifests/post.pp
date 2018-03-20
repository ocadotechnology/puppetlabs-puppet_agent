# == Class puppet_agent::post
#
# This class is called from puppet_agent after the upgrade.
#
class puppet_agent::post {
  include puppet_agent::params


  if versioncmp("${::clientversion}", '4.0.0') < 0 {
    # Migrate old files; assumes user Puppet runs under won't change during upgrade
    # We assume the current Puppet settings are authoritative; if anything exists
    # in the destination but not the source, it'll be overwritten.

    if !$_windows_client { #Windows didn't change only nix systems

      class { 'puppet_agent::post::concat':
        before => Class[$_osfamily_class],
      }
      class { 'puppet_agent::post::patch':
        before => Class[$_osfamily_class],
      }
      contain puppet_agent::post::concat
      contain puppet_agent::post::patch

    }
  }

}
