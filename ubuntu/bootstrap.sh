#!/usr/bin/env bash

read -s -p "sudo password: " sudo_pass && echo

# Ensure the password file is cleaned up even on error/interrupt
trap 'rm -f become_pass.txt' EXIT

# Create with restrictive perms (0600)
(umask 077 && printf '%s\n' "$sudo_pass" > become_pass.txt)

echo $sudo_pass | sudo -S apt update
echo $sudo_pass | sudo -S apt install -y ansible curl git stow

echo "Executing Ansible playbook ..."
ansible-pull --become-password-file become_pass.txt -i $HOSTNAME, --limit=localhost,$HOSTNAME -U https://github.com/Dapacruz/.dotfiles ubuntu/ansible/playbooks/deploy-dotfiles.yml

