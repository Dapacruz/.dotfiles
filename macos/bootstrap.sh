#!/usr/bin/env bash

read -s -p "sudo password: " sudo_pass && echo

# Ensure the password file is cleaned up even on error/interrupt
trap 'rm -f become_pass.txt' EXIT

# Create with restrictive perms (0600)
(umask 077 && printf '%s\n' "$sudo_pass" > become_pass.txt)

echo $sudo_pass | sudo -S sh -c "echo '${USER} ALL=(root) NOPASSWD: ALL' > /etc/sudoers.d/homebrew-temp"

if ! command -v brew &> /dev/null
then
    echo "Installing Homebrew ..."
    CI=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if ! command -v ansible &> /dev/null
then
    echo "Installing Ansible ..."
    brew install ansible
fi

echo "Executing Ansible playbook ..."
ansible-pull --become-password-file become_pass.txt -i $HOSTNAME, --limit=localhost,$HOSTNAME -U https://github.com/Dapacruz/.dotfiles macos/ansible/playbooks/deploy-dotfiles.yml

echo "Removing /etc/sudoers.d/homebrew-temp file ..."
echo $sudo_pass | sudo -S rm -f /etc/sudoers.d/homebrew-temp

