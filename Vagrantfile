# -*- mode: ruby -*-
# vi: set ft=ruby :

# Multi-VM Configuration: Builds Web, Application, and Database Servers using JSON config file
# Configures VMs based on Hosted Chef Server defined Environment and Node (vs. Roles)

# read vm and chef configurations from JSON files
nodes_config = (JSON.parse(File.read("nodes.json")))['nodes']

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box     = "puppetlabs/centos-6.6-64-puppet"

  # hostmanager
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.manage_guest = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = false

  nodes_config.each do |node|
    node_name   = node[0] # name of node
    node_values = node[1] # content of node

    config.vm.define node_name do |config|    
      # configures all forwarding ports in JSON array
      ports = node_values['ports']
      ports.each do |port|
        config.vm.network :forwarded_port,
          host:  port[':host'],
          guest: port[':guest'],
          id:    port[':id']
      end

      config.vm.hostname = node_values[':node']
      config.vm.network :private_network, ip: node_values[':ip']

      config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", node_values[':memory']]
        vb.customize ["modifyvm", :id, "--name", node_values[':node']]
      end

	  config.vm.provision :hostmanager

      # Node configuration section
	  config.vm.provision :shell, :path => node_values[':bootstrap']

	  # Alternatively we could use the existing puppet modules
	  # more info at https://www.vagrantup.com/docs/provisioning/puppet_apply.html

    end
  end
end
