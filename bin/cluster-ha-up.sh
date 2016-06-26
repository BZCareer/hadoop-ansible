#!/bin/bash
# Author: Zak Hassan
# Please install vagrant plugin install vagrant-env. More info can be found here: https://github.com/gosuri/vagrant-env
export MD_HADOOP_MODE='cluster'
export ANSIBLE_SITE_YML = 'site-ha.xml'
vagrant up
