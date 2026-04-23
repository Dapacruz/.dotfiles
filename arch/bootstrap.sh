#!/usr/bin/env bash

read -s -p "sudo password: " sudo_pass && echo

# Ensure the password file is cleaned up even on error/interrupt
trap 'rm -f become_pass.txt' EXIT

# Create with restrictive perms (0600)
(umask 077 && printf '%s\n' "$sudo_pass" > become_pass.txt)

echo $sudo_pass | sudo -S pacman -Syq --needed --noconfirm ansible curl git stow

echo "Installing Ansible collections ..."
ansible-galaxy collection install --upgrade community.general kewlfft.aur

echo "Executing Ansible playbook ..."
rm -fr ~/.ansible/pull/$HOSTNAME
ansible-pull --become-password-file become_pass.txt -i $HOSTNAME, --limit=localhost,$HOSTNAME -U https://github.com/Dapacruz/.dotfiles arch/ansible/playbooks/deploy-dotfiles.yml

