# Ansible playground

The goal of this repository is to create an environment to test ansible playbooks via a Docker container. 

# Setup

#Generate an SSH keypair:
#‘‘‘
#ssh-keygen -b 2048 -t rsa -f resources/id_ed25519 -q -N ""
#ssh-add resources/id_ed25519
#‘‘‘

# Usage

Start the container and run the ansible playbook:
‘‘‘
./start-playbook-test.sh
‘‘‘