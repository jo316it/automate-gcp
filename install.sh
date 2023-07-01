#!/bin/bash
   
sudo apt update -y && \
sudo apt install software-properties-common && \
sudo add-apt-repository --yes --update ppa:ansible/ansible && \
sudo apt install ansible curl git -y

sudo cat <<EOT >> /etc/hosts

    10.150.0.20 control-node
    10.150.0.21 app-01
    10.150.0.22 db-01
EOT
