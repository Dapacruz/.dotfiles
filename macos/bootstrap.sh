#!/usr/bin/env bash

# read -s -p "sudo password: " sudo_pass && echo
# echo $sudo_pass > become_pass.txt

if ! command -v brew &> /dev/null
then
    echo "Installing Homebrew ..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if ! command -v ansible &> /dev/null
then
    echo "Installing Ansible ..."
    brew install ansible
fi

echo "Executing Ansible playbook ..."
# ansible-pull --become-password-file become_pass.txt -i $HOSTNAME, --limit=localhost,$HOSTNAME -U https://github.com/Dapacruz/.dotfiles macos/ansible/playbooks/deploy-dotfiles.yml
ansible-pull -U https://github.com/Dapacruz/.dotfiles macos/ansible/playbooks/deploy-dotfiles.yml

