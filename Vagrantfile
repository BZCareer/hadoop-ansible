# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Must install 'vagrant plugin install vagrant-env' for this to work
  config.env.enable
  config.ssh.insert_key = false

# Defining Nodes if you would like to demo more then two nodes increase the number below
  (1..2).each do |i|
     config.vm.define "hadoopdatanode#{i}" do |node|
         node.vm.box = ENV['LINUX_IMAGE'] #"centos/7"
         node.vm.hostname = "hadoopdata#{i}"
         node.vm.network :private_network, ip: "192.168.33.4#{i}"
         node.vm.provider "virtualbox" do |v|
           v.cpus = ENV['CPU']
           v.memory = ENV['MEMORY']
         end
         node.vm.provision :file do |file|
           file.source      = ENV['PEM_KEY']
           file.destination = ENV['ID_RSA']
         end
     end
   end

# Only creates ha mode if environment variable is set
if ENV['MD_HADOOP_MODE'] == 'cluster'
    # Defining Master Node
     config.vm.define "hadoopmaster3" do |hadoopmaster|
       hadoopmaster.vm.hostname = "hadoopmaster3"
       hadoopmaster.vm.box = ENV['LINUX_IMAGE'] #"centos/7"
       #hadoopmaster.vm.synced_folder ".", "/home/vagrant", mount_options: ["dmode=775,fmode=664"]
       hadoopmaster.vm.network "private_network", ip: "192.168.33.38"
         hadoopmaster.vm.provider "virtualbox" do |v|
           v.name = "hadoopmaster3"
           v.cpus = ENV['CPU']
           v.memory = ENV['MEMORY']
         end
       # copy private key so hosts can ssh using key authentication (the script below sets permissions to 600)
       hadoopmaster.vm.provision :file do |file|
         file.source      = ENV['PEM_KEY']
         file.destination = ENV['ID_RSA']
       end
       end

    # Defining Master Node
    config.vm.define "hadoopmaster2" do |hadoopmaster|
      hadoopmaster.vm.hostname = "hadoopmaster2"
      hadoopmaster.vm.box = ENV['LINUX_IMAGE'] #"centos/7"
    #hadoopmaster.vm.synced_folder ".", "/home/vagrant", mount_options: ["dmode=775,fmode=664"]
      hadoopmaster.vm.network "private_network", ip: "192.168.33.39"
      hadoopmaster.vm.provider "virtualbox" do |v|
        v.name = "hadoopmaster2"
        v.cpus = ENV['CPU']
        v.memory = ENV['MEMORY']
      end
    # copy private key so hosts can ssh using key authentication (the script below sets permissions to 600)
      hadoopmaster.vm.provision :file do |file|
        file.source      = ENV['PEM_KEY']
        file.destination = ENV['ID_RSA']
      end
    end

end

   # Defining Base Master Node
   config.vm.define "hadoopmaster" do |hadoopmaster|
   hadoopmaster.vm.hostname = "hadoopmaster"
   hadoopmaster.vm.box = ENV['LINUX_IMAGE'] #"centos/7"
   #hadoopmaster.vm.synced_folder ".", "/home/vagrant", mount_options: ["dmode=775,fmode=664"]
   hadoopmaster.vm.network "private_network", ip: "192.168.33.40"
   hadoopmaster.vm.provider "virtualbox" do |v|
     v.name = "hadoopmaster"
     v.cpus = ENV['CPU']
     v.memory = ENV['MEMORY']
   end
   # copy private key so hosts can ssh using key authentication (the script below sets permissions to 600)
   hadoopmaster.vm.provision :file do |file|
     file.source      = ENV['PEM_KEY']
     file.destination = ENV['ID_RSA']
   end

   hadoopmaster.vm.provision "ansible" do |ansible|
          ansible.playbook       = ENV['ANSIBLE_SITE_YML']
          ansible.verbose        = true
          ansible.limit          = "all" # or only "nodes" group, etc.
          ansible.inventory_path = "inventory.yml"
   end
end

end
