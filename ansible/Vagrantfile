# -*- mode: ruby -*-
# vi: set ft=ruby :

#PEM_KEY                             = '$HOME/.vagrant.d/insecure_private_key'
#ENV['ID_RSA']                              = '/home/vagrant/.ssh/ENV['ID_RSA']'
HADOOP_MASTER_IP                    = '192.168.33.40'
HADOOP_DATANODE_1_IP                = '192.168.33.41'
HADOOP_DATANODE_2_IP                = '192.168.33.42'
ANSIBLE_SITE_YML                    = 'site.yml'
Vagrant.configure("2") do |config|
  # Must install 'vagrant plugin install vagrant-env' for this to work
  config.env.enable
  config.ssh.insert_key = false

# Defining Nodes if you would like to demo more then two nodes increase the number below
  (1..2).each do |i|
     config.vm.define "hadoopdatanode#{i}" do |node|
         node.vm.box = "bento/centos-7.1" #"centos/7"
         node.vm.hostname = "hadoopdatanode#{i}"
         node.vm.network :private_network, ip: "192.168.33.4#{i}"
         node.vm.provider "virtualbox" do |vb|
           vb.cpus = 1
           vb.memory = 1024
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
       hadoopmaster.vm.box = "bento/centos-7.1" #"centos/7"
       #hadoopmaster.vm.synced_folder ".", "/home/vagrant", mount_options: ["dmode=775,fmode=664"]
       hadoopmaster.vm.network "private_network", ip: "192.168.33.38"
         hadoopmaster.vm.provider "virtualbox" do |v|
           v.name = "hadoopmaster3"
           v.cpus = 1
           v.memory = 1024
         end
       # copy private key so hosts can ssh using key authentication (the script below sets permissions to 600)
       hadoopmaster.vm.provision :file do |file|
         file.source      = ENV['PEM_KEY']
         file.destination = ENV['ID_RSA']
       end
       #hadoopmaster.vm.provision "shell", path: "bootstrap.sh"
       end

    # Defining Master Node
    config.vm.define "hadoopmaster2" do |hadoopmaster|
      hadoopmaster.vm.hostname = "hadoopmaster2"
      hadoopmaster.vm.box = "bento/centos-7.1" #"centos/7"
    #hadoopmaster.vm.synced_folder ".", "/home/vagrant", mount_options: ["dmode=775,fmode=664"]
      hadoopmaster.vm.network "private_network", ip: "192.168.33.39"
      hadoopmaster.vm.provider "virtualbox" do |v|
        v.name = "hadoopmaster2"
        v.cpus = 1
        v.memory = 1024
      end
    # copy private key so hosts can ssh using key authentication (the script below sets permissions to 600)
      hadoopmaster.vm.provision :file do |file|
        file.source      = ENV['PEM_KEY']
        file.destination = ENV['ID_RSA']
      end
    #hadoopmaster.vm.provision "shell", path: "bootstrap.sh"
    end

end

   # Defining Base Master Node
   config.vm.define "hadoopmaster" do |hadoopmaster|
   hadoopmaster.vm.hostname = "hadoopmaster"
   hadoopmaster.vm.box = "bento/centos-7.1" # "centos/7"
   #hadoopmaster.vm.synced_folder ".", "/home/vagrant", mount_options: ["dmode=775,fmode=664"]
   hadoopmaster.vm.network "private_network", ip: "192.168.33.40"
   hadoopmaster.vm.provider "virtualbox" do |v|
     v.name = "hadoopmaster"
     v.cpus = 1
     v.memory = 2048
   end
   # copy private key so hosts can ssh using key authentication (the script below sets permissions to 600)
   hadoopmaster.vm.provision :file do |file|
     file.source      = ENV['PEM_KEY']
     file.destination = ENV['ID_RSA']
   end

   hadoopmaster.vm.provision "shell", path: "bootstrap.sh"
   hadoopmaster.vm.provision "ansible" do |ansible|
          ansible.playbook       = ENV['ANSIBLE_SITE_YML']
          ansible.verbose        = true
          ansible.limit          = "all" # or only "nodes" group, etc.
          ansible.inventory_path = "inventory.yml"
   end
end

end
