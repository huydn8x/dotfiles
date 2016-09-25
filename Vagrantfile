Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "bento/centos-6.8"
  #config.ssh.username = "phucngo"
  config.ssh.private_key_path="~/.ssh/id_rsa"
  config.vm.box_check_update = false
  config.vm.network "private_network", ip: "192.168.33.10"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
end
