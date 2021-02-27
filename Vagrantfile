Vagrant.require_version ">= 1.8.0"

$msg = <<MSG
--------------------------------------------------------
Welcome to the VA.gov CMS VM!

To add this machine to your ssh config, run the
following command:

vagrant ssh-config --host va.gov-cms-vm >> ~/.ssh/config
--------------------------------------------------------
MSG

Vagrant.configure("2") do |config|
  # Set up resource defaults.
  config.vm.provider "virtualbox" do |v|
    v.memory = 8096
    v.cpus = 3
  end

  # Install Ubuntu 20 LTS.
  config.vm.box = "ubuntu/focal64"

  # Install application.
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "provisioning/playbook.yml"
    ansible.galaxy_role_file = "provisioning/requirements.yml"
  end

  config.vm.post_up_message = $msg
end
