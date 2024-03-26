# Config-server

A set of Ansible playbooks and scripts to configure a server for Klivar

## Dependencies and prerequisites

- SSH keys having access to the servers defined in the [inventory.yml](./inventory.yml)
- Ansible installed: `pip3 install ansible==9.3.0`
- Ansible roles and collections: `ansible-galaxy install -r requirements.yml --force`

## The playbooks

TODO

## Configure a new server

Before using Ansible, here are a few things to do:

1. Change the SSH default port. Connect to the serveur and edit the file `/etc/ssh/sshd_config`. There is a commented
   line `#Port 22`. Change it to `Port 2209` (or something else). Restart `sshd` service: `sudo systemctl restart sshd`.
2. Connect to the server and upload your SSH public key to the default user. We will disable login via password later
   one.
3. Make sure you can connect via your SS private key before moving on.

The playbooks in this repo are focused on Debian based distributions. Once you got a new serveur, add its information
into the [inventory.yml](./inventory.yml) file similar to the existing hosts. 

