#!/bin/bash

sudo yum update -y
sudo useradd sonar

sudo yum install wget unzip java-11-openjdk-devel -y && \

wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.1.0.47736.zip && \

unzip sonarqube-9.1.0.47736.zip -d /opt/ && \

sudo mv /opt/sonarqube-9.1.0.47736 /opt/sonarqube && \

chown -R sonar:sonar /opt/sonarqube && \


wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.6.2.2472-linux.zip && \

sudo unzip sonar-scanner-cli-4.6.2.2472-linux.zip -d /opt/sonar-scanner && \

sudo chown -R sonar:sonar /opt/sonarqube && \

sudo chown -R sonar:sonar /opt/sonar-scanner


echo 'export PATH=$PATH:/opt/sonar-scanner/bin' | sudo tee -a /etc/profile


curl –sL https://rpm.nodesource.com/setup_10.x | sudo bash -

sudo yum install nodejs -y

sudo cp /tmp/sonarqube.service /etc/systemd/system/

sudo systemctl start sonarqube


# sonar-scanner \
#   -Dsonar.projectKey=redis \
#   -Dsonar.sources=/home/ubuntu \
#   -Dsonar.host.url=http://localhost:9000 \
#   -Dsonar.login=aff7cca8fe63ba6b63b8cd1787122f0a418ae512