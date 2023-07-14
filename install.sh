# #!/bin/bash

USERNAME="sonar"

echo "[1 - Prepare your Ubuntu server.]"

sudo timedatectl set-timezone America/Sao_Paulo


sudo apt update -y && \
sudo apt upgrade -y && \

echo "[2 -Install OpenJDK 11]"

sudo apt install -y wget unzip unzip wget openjdk-11-jdk && \



echo "[3 -Download and Install SonarQube]"

sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.1.0.47736.zip && \
sudo unzip sonarqube-9.1.0.47736.zip && \
sudo mv sonarqube-9.1.0.47736/ /opt/sonarqube && \

sleep 2

echo "[4 - Add SonarQube Group and User]"
sudo groupadd $USERNAME && \
sudo useradd -d /opt/sonarqube -g $USERNAME $USERNAME && \
sudo chown $USERNAME:$USERNAME /opt/sonarqube -R && \

sleep 2

sudo cp /tmp/sonar.service /etc/systemd/system/ && \

sudo systemctl enable sonar && \
sudo systemctl start sonar && \

echo "[5 - Install Sonar Scanner]"

wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.6.2.2472-linux.zip && \
sudo unzip sonar-scanner-cli-4.6.2.2472-linux.zip && \
sudo mv sonar-scanner-4.6.2.2472-linux /opt/sonar-scanner &&\
sudo chown -R jenkins:jenkins /opt/sonar-scanner

sudo mv /tmp/sonar-scanner.sh /etc/profile.d/

echo "[7 - Install Nodejs]"

curl -sL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt-get install -y nodejs

sudo touch /usr/bin/env-sonar.sh && \
sudo touch /etc/rc.local && \

sudo echo "source /etc/profile.d/sonar-scanner.sh" > touch /usr/bin/env-sonar.sh && \

sudo echo "/usr/bin/env-sonar.sh" > /etc/rc.local && \

echo "[6 - Finished Installation]"

sleep 5



