#!/usr/bin/env bash

read -s -p "sudo password: " sudo_pass && echo
echo $sudo_pass > become_pass.txt

echo $sudo_pass | sudo -S pacman -Syq --noconfirm ansible curl git stow

echo "Executing Ansible playbook ..."
ansible-pull --become-password-file become_pass.txt -i $HOSTNAME, --limit=localhost,$HOSTNAME -U https://github.com/Dapacruz/.dotfiles arch/ansible/playbooks/deploy-dotfiles.yml

rm become_pass.txt

