#!/bin/bash

if [ -d /etc/ansible ]; then

    echo "Ansible found"
    ansible --version | grep -E "^\s*(ansible|python version =) [0-9\.]+"

    cd /etc/ansible
    echo "Update inventory location"

    if [ ! -d /etc/ansible/inventory ]; then
        mkdir /etc/ansible/inventory
        chmod -R 2774 /etc/ansible/inventory
    fi

    if [ -f /etc/ansible/ansible.cfg ]; then
        sed -i -r 's@#?inventory([ ]*)=([ ]*).*@inventory\1=\2\/etc\/ansible\/inventory\/all.py@' /etc/ansible/ansible.cfg
    fi

	echo ""
	echo "For dynamic inventory test:"
	echo "  With python"
	echo "  	/etc/ansible/inventory/all.py --list"
	echo "  	/etc/ansible/inventory/all.py --host <hostname>"
	echo ""
	echo "  With ansible"
	echo "  	ansible-inventory --list"
	echo "  	ansible-inventory --host <hostname>"
	echo "  	ansible all -m ping"
	echo ""

fi