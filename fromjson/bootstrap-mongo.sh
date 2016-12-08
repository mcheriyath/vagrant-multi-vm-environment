#!/bin/bash

cat <<EOF >  /etc/yum.repos.d/mongodb.repo
[mongodb]
name=MongoDB Repository
baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/
gpgcheck=0
enabled=1
EOF

yum install -y --disableexcludes=all mongodb-org-2.6.9 mongodb-org-server-2.6.9 mongodb-org-shell-2.6.9 mongodb-org-mongos-2.6.9 mongodb-org-tools-2.6.9

echo "exclude=mongodb-org,mongodb-org-server,mongodb-org-shell,mongodb-org-mongos,mongodb-org-tools" >> /etc/yum.conf

sudo chkconfig mongod on
service mongod start
