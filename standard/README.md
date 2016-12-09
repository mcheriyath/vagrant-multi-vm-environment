# vagrant-multi-vm-environment
Creates VM boxes and provisioning with puppet modules

### Vagrant Boxes explained

Customized Vagrant boxes with puppet modules
##### db (Oracle XE) - Reference from [Matthew Baldwin](https://github.com/matthewbaldwin/vagrant-xe11g)<br>

Step 1. Get oracle-xe-11.2.0-1.0.x86_64.rpm from [oracle downloads](http://www.oracle.com/technetwork/database/database-technologies/express-edition/downloads/index.html) and extract the rpm onto the root folder<br>
Step 2. Downloaded a few puppet modules: [fiddyspence-sysctl](https://forge.puppet.com/fiddyspence/sysctl) and [erwbgy-limits](https://forge.puppet.com/erwbgy/limits) <br>
Step 3. Copied xe.rsp and sql scripts onto root folder <br>
Step 4. Start oracle vm within the vagrant<br>
````code
time vagrant up db
````
Step 5. To destroy without confirmation(force) <br>
````code
time vagrant destroy db -f
````
##### mongodb <br>

Start mongo vm within the vagrant<br>
````code
time vagrant up mongo
````
Sometimes puppetlabs-mongodb module throws an error for not finding the right package. If that occurs we need to re-run a provision <br>
````code
time vagrant provision mongo
````
To destroy without confirmation(force) <br>
````code
time vagrant destroy mongo -f
````
