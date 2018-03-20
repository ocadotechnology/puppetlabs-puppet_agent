Facter.add('legacy_patch_dir_exists') do
  confine :kernel => 'Linux'
  setcode do

    File.exists?('/var/lib/puppet/patch')

  end
end
