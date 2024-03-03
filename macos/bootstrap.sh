#!/usr/bin/env bash

if ! command -v brew &> /dev/null
then
    echo "Installing Homebrew ..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Dapacruz/.dotfiles/master/macos/packages/homebrew-install.sh)"
fi

if ! command -v ansible &> /dev/null
then
    echo "Installing Ansible ..."
    brew install ansible
fi

echo "Executing Ansible playbook ..."
ansible-pull -U https://github.com/Dapacruz/.dotfiles macos/ansible/playbooks/deploy-dotfiles.yml
