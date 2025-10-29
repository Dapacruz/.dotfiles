#!/usr/bin/env bash

if ! command -v curl &> /dev/null
then
    echo "Installing cURL ..."
    sudo apt update && sudo apt install -y curl
fi

if ! command -v ansible &> /dev/null
then
    echo "Installing Ansible ..."
    sudo apt update && sudo apt install -y ansible
fi

echo "Executing Ansible playbook ..."
ansible-pull -K -U https://github.com/Dapacruz/.dotfiles linux/ansible/playbooks/deploy-dotfiles.yml
