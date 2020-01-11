# -*- mode: ruby -*-
# vim: set ft=ruby :

require 'yaml'
nodes = YAML.load_file('nodes.yml')

Vagrant.configure(2) do |config|
  nodes.each do |nodes|

    config.vm.define nodes["name"] do |node|
      node.vm.hostname = nodes["name"]
      node.vm.box = nodes["vm_box"]

      node.vm.provider "virtualbox" do |vb|
        vb.name = nodes["name"]
        vb.memory = nodes["vm_memory"]
        vb.cpus = nodes["vm_cpus"]
      end

      nodes["privNet"].each do |param|
        node.vm.network "private_network", param
      end

      #nodes["pubNet"].each do |param|
      #  node.vm.network "public_network", param
      #end

      node.vm.synced_folder "sync", "/vagrant", type: "rsync"

      node.vm.provision "shell", path: "nosync/shell/postinstall.sh"

      #node.vm.provision "ansible_local" do |ansible|
      #  ansible.playbook = "/vagrant/ansible/ansible.yml"
	    #end

    end
  end

end