# Klivar Databases and users

This Terraform project contains the databases and users used by Klivar.

## How to and pre-requisites

1. Since the Database is not remotely accessible, we need to set up a port forwarding with SSH to access it. So you need
   SSH access to server. This command creates the port
   forwarding: `ssh -L 5432:localhost:5432 -p 2209 debian@db-admin.klivar.com -N`. After running this, the remote DB is
   accessible via `localhost:5432`.
2. Export an environment variable for the `postgres` superuser. `export PGPASSWORD='xxxxxxx'`
3. Go into this folder and run `terraform init` to init the project.
4. Run `terraform apply` to check and apply your changes.


