# vagrant-multi-vm-environment
Goal is to create a dev environment with a few virtual machines dedicated for services like, Application server, MongoDB, Oracle XE, Solr and Apache

## Pre-requisites
- Vagrant with hostmanager plugin
- VirtualBox
- CentOS Virtualbox image

## Two possible methods
1. Launch VM Boxes with Vagrant defined from a json file along with bootstrap scripts to perform provisioning
2. Launch VM Boxes with Vagrant in standard mode along with puppet modules for provisioning. 
