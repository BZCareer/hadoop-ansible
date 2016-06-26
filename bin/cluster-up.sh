#!/bin/bash
# Author: Zak Hassan
# Please install vagrant plugin install vagrant-env. More info can be found here: https://github.com/gosuri/vagrant-env
export MD_HADOOP_MODE='local'
export ANSIBLE_SITE_YML = 'site.xml'
vagrant up
