vm-up:
	vagrant up
run-playbook:
	ansible-playbook site.yml
download-artifacts:
	./bin/get-binaries
create-certs:
	./bin/ssh-gen.sh
install-vm-plugins:
	./bin/vm-plugins.sh
