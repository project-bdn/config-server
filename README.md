# Config-server

A set of Ansible playbooks and scripts to configure a server for Klivar

## Dependencies and prerequisites

- SSH keys having access to the servers defined in the [inventory.yml](./inventory.yml)
- Ansible installed: `pip3 install ansible==9.3.0`
- Ansible roles and collections: `ansible-galaxy install -r requirements.yml --force`

## Initial Configuration of a new server

Before using Ansible, here are a few things to do:

1. Change the SSH default port. Connect to the serveur and edit the file `/etc/ssh/sshd_config`. There is a commented
   line `#Port 22`. Change it to `Port 2209` (or something else). Restart `sshd` service: `sudo systemctl restart sshd`.
2. Connect to the server and upload your SSH public key to the default user. We will disable login via password later
   one.
3. Make sure you can connect via your SS private key before moving on.

The playbooks in this repo are focused on Debian based distributions. Once you got a new serveur, add its information
into the [inventory.yml](./inventory.yml) file similar to the existing hosts.

## The playbooks

The playbook names usually define the order in which to run them to configuration a new server. Not all playbook apply
to servers.

- [01-base.yml](01-base.yml): Security related settings about SSH and some common settings and packages to apply to all
  server owned by Klivar.
- [10-docker.yml](10-docker.yml): Install Docker, init docker Swarm, crontab to prune Docker everyday
- [11-docker-reverse-proxy.yml](11-docker-reverse-proxy.yml): Install the reverse-proxy (traefik)
- [12-docker-portainer.yml](12-docker-portainer.yml): Install portainer

## How to run a playbook locally

1. Make sure you have the relevant SSH keys on our machine that have access to the servers in the inventory file.
2. You need the ansible vault password. Create the file `.vault_pass` and put the password in it.
2. Run this to test the connection to the serveur `ansible -m setup all`. This command will gather and display some
   metadata for **all**  servers in the inventory file.
3. To run a playbook a specific host (in this case the `ovh_manager`): `ansible-playbook docker.yml ovh_manager`
