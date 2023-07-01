#!/bin/bash

sudo su && 
apt-get install git -y && \
curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
chmod +x /usr/local/bin/docker-compose && \
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

sleep 2

