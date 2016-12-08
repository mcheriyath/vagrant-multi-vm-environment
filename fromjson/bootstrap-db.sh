#!/bin/bash

yum install -y libaio bc flex

mkdir -p /etc/puppet/modules
puppet module list | grep -q puppetlabs-java || puppet module install puppetlabs-java
