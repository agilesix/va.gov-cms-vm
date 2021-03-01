Vagrant.require_version ">= 1.8.0"

vm_dir = File.dirname(File.expand_path(__FILE__))
config_file = "#{vm_dir}/config.yml"
unless File.exist?(config_file)
  raise_message "Configuration file not found! Expected in #{config_file}"
end

vconfig = {}
if File.exist?(config_file)
  optional_config = YAML.load_file(config_file)
  vconfig.merge!(optional_config) if optional_config
end


$msg = <<MSG
--------------------------------------------------------
Welcome to the VA.gov CMS VM!

Please connect using your IDE's ssh plugin and the
hostname: va.gov-cms-vm
--------------------------------------------------------
MSG

Vagrant.configure("2") do |config|
  # Set up resource defaults.
  config.vm.provider "virtualbox" do |v|
    v.memory = vconfig['vagrant_memory']
    v.cpus = vconfig['vagrant_cpus']
  end

  # Install Ubuntu 20 LTS.
  config.vm.box = "ubuntu/focal64"

  # Set up SSH
  config.vm.provision "shell" do |s|
    ssh_prv_key = ""
    ssh_pub_key = ""
    if File.file?("#{Dir.home}/.ssh/#{vconfig['gh_keyname']}")
      ssh_prv_key = File.read("#{Dir.home}/.ssh/#{vconfig['gh_keyname']}")
      ssh_pub_key = File.readlines("#{Dir.home}/.ssh/#{vconfig['gh_keyname']}.pub").first.strip
    else
      puts "No SSH key found. You will need to remedy this before pushing to the repository."
    end
    s.inline = <<-SHELL
      if grep -sq "#{ssh_pub_key}" /home/vagrant/.ssh/authorized_keys; then
        echo "SSH keys already provisioned."
        exit 0;
      fi
      echo "SSH key provisioning."
      mkdir -p /home/vagrant/.ssh/
      touch /home/vagrant/.ssh/authorized_keys
      echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
      echo #{ssh_pub_key} > /home/vagrant/.ssh/#{vconfig['gh_keyname']}.pub
      chmod 644 /home/vagrant/.ssh/id_rsa.pub
      echo "#{ssh_prv_key}" > /home/vagrant/.ssh/#{vconfig['gh_keyname']}
      chmod 600 /home/vagrant/.ssh/#{vconfig['gh_keyname']}
      chown -R vagrant:vagrant /home/vagrant
      exit 0
    SHELL
  end

  # Install application.
  config.vm.provision "ansible_local" do |ansible|
    ansible.extra_vars = {
      gh_username: vconfig['gh_username']
    }
    ansible.playbook = "provisioning/playbook.yml"
    ansible.galaxy_role_file = "provisioning/requirements.yml"
  end

  config.trigger.after :up do |trigger|
    trigger.info = "Starting lando. This may take a few minutes!"
    trigger.run_remote = {inline: "cd ~vagrant/va.gov-cms && sudo -u vagrant lando start"}
  end

  config.trigger.after :up do
    system('./scripts/setup_ssh.sh')
  end

  config.vm.post_up_message = $msg

end
