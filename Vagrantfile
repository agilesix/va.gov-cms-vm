Vagrant.require_version ">= 1.8.0"


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
end
