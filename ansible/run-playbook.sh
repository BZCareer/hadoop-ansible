#!/bin/bash
#
# Author: Zak Hassan
export ANSIBLE_HOST_KEY_CHECKING=False
export ANSIBLE_CONFIG=/vagrant/ansible.cfg
ansible-playbook -i invm.yml  site.yml $AN_ARGS
