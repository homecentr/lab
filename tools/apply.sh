#!/usr/bin/env bash

printHelp() {
  echo "Usage: apply <playbook>"
}

PLAYBOOK="./playbooks/${1:-_all}.yml"

if [ ! -f "$PLAYBOOK" ]; then
  printHelp
  echo "Playbook $PLAYBOOK could not be found"
  exit 2
fi

shift

export ANSIBLE_CONFIG="./ansible.cfg"

# Install Ansible dependencies (roles and collections)
ansible-galaxy install -r ./requirements.yml

COMMAND="ansible-playbook -i inventory.yml $PLAYBOOK ${@:1}"

echo $COMMAND

# Execute playbook
eval $COMMAND