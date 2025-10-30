#!/usr/bin/env bash

read -s -p "sudo password: " sudo_pass && echo
echo $sudo_pass > become_pass.txt

echo $sudo_pass | sudo -S apt update
echo $sudo_pass | sudo -S apt install -y ansible curl git

echo "Executing Ansible playbook ..."
ansible-pull --become-password-file become_pass.txt -i $HOSTNAME, --limit=localhost,$HOSTNAME -U https://github.com/Dapacruz/.dotfiles linux/ansible/playbooks/deploy-dotfiles.yml

rm become_pass.txt

