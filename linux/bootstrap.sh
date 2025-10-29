#!/usr/bin/env bash

echo "Executing Ansible playbook ..."
ansible-pull -K -U https://github.com/Dapacruz/.dotfiles linux/ansible/playbooks/deploy-dotfiles.yml
