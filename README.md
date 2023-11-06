# Lab environment

This repository contains Ansible playbooks to manage the server hosting [lab environment](TBA). The server is intended to run on best effort basis meaning it does not have any availability strategy and if it gets into a state which is difficult to recover from, it can be easily reinstalled and reconfigured using these playbooks.

## Creating a Lab environment
- Install Proxmox from the official ISO image with the configuration below:
    - Disk: ZFS with RAID0 (all disks)
    - Country: Czechia
    - Timezone: Europe/Prague
    - Password: any, just watch out for english keyboard layout when typing numbers
    - E-mail: anything
    - Hostname: anything
    - IP Address: 10.1.8.10/24
    - Gateway: 10.1.8.1
- Remove previous SSH keys in case you have re-created the lab using the `yarn clear-keys` command
- If it's a fresh install, initialize the server using the `yarn run init` command
- Apply playbooks using the `yarn apply` command
- After the playbooks have been applied, install the individual Proxmox lab VMs through Proxmox UI with the configuration below:
  - Disk: ZFS with RAID0
  - Country: Czechia
  - Timezone: Europe/Prague
  - Password: any, just watch out for english keyboard layout when typing numbers and make sure **all nodes have the same password**
  - E-mail: pve&lt;X&gt;@lab.&lt;domain&gt;
  - Hostname: pve&lt;X&gt;.lab.&lt;domain&gt;
  - IP Address: 10.1.8.1&lt;X&gt;/24
  - Gateway: 10.1.8.1
- Turn the individual nodes into a Proxmox cluster (there's currently no good way to automate this)