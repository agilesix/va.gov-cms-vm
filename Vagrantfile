Vagrant.require_version ">= 1.8.0"

# Install Ubuntu 20 LTS
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "provisioning/playbook.yml"
    ansible.galaxy_role_file = "provisioning/requirements.yml"
  end
end
