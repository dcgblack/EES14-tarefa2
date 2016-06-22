# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.ssh.forward_agent = true
  config.vm.box = "ubuntu/trusty32"

  config.vm.define "rails1", primary: true do |rails1|
    rails1.vm.network :forwarded_port, host: 42022, guest: 22
    rails1.vm.network :forwarded_port, host: 43000, guest: 3000
    rails1.vm.hostname = 'rails1'

    rails1.vm.provider "virtualbox" do |v|
      v.name = "rails1"
    end

    rails1.vm.provision 'ansible' do |ansible|
      ansible.host_key_checking = false
      ansible.playbook = "playbook.yml"
      ansible.raw_ssh_args = ['-o UserKnownHostsFile=/dev/null -o ForwardAgent=yes']
    end
  end
end
