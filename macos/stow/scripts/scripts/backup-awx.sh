#!/bin/sh

cd $HOME/Ansible/WSI/Local
/usr/local/bin/ansible-playbook playbooks/awx/backup.yml > /tmp/backup-awx.log
curl -X POST -H 'Content-type: application/json' --data "{'text':'Backup of AWX is now complete.'}" '***REMOVED***'
