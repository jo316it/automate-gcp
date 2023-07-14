# #!/bin/bash


# USERNAME="sonar"
# PASSWORD="sonarpass"
# SONAR_DB="sonardb"
# SONAR_PROPER="/opt/sonarqube/conf/sonar.properties"
# SONAR_SH="/opt/sonarqube/bin/linux-x86-64/sonar.sh"
# SYST_CTL="/etc/sysctl.conf"


# echo "[1 - Prepare your Ubuntu server.]"

#sudo timedatectl set-timezone America/Sao_Paulo


# sudo apt update -y && \
# sudo apt upgrade -y && \

# echo "[2 -Install OpenJDK 11]"

# sudo apt install -y unzip wget openjdk-11-jdk && \

# echo "[3 - Install and Configure PostgreSQL]"
# sleep 2

# echo  "[Add PostgreSQL repository.]"
# sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list' && \

# echo "[4 -Add PostgreSQL signing key.]"
# wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | sudo apt-key add - && \
# sleep 1

# echo "[5 - Install PostgreSQL.]"
# sudo apt install -y postgresql postgresql-contrib && \

# sleep 1

# echo "[6 -Enable DB server to start automatically on reboot.]"
# sudo systemctl enable postgresql && \
# sleep 1

# echo "[7 -Start DB server.]"
# sudo systemctl start postgresql && \
# sleep 1

# echo "[8 - Create Database]"
# sudo -u postgres psql -c "CREATE DATABASE $SONARDB" && \
# sudo -u postgres psql -c "CREATE USER $USERNAME WITH PASSWORD '$PASSWORD';" && \
# sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE $SONARDB TO $USERNAME;" && \

# sleep 2

# echo "[9 -Download and Install SonarQube]"

# sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.0.1.46107.zip && \
# sudo unzip sonarqube-9.0.1.46107.zip && \
# sudo mv sonarqube-9.0.1.46107 /opt/sonarqube && \

# sleep 2

# echo "[10 - Add SonarQube Group and User]"
# sudo groupadd $USERNAME && \
# sudo useradd -d /opt/sonarqube -g $USERNAME $USERNAME && \
# sudo chown $USERNAME:$USERNAME /opt/sonarqube -R && \

# sleep 2

# echo "[11 - Configure SonarQube]"

# sudo sed -i "s/^#sonar.jdbc.username=.*/sonar.jdbc.username=$USERNAME/" $SONAR_PROPER && \
# sudo sed -i "s/^#sonar.jdbc.password=.*/sonar.jdbc.password=$PASSWORD/" $SONAR_PROPER && \

# sudo sed -i 's/^#sonar\.jdbc\.url=jdbc:oracle:thin:@localhost:1521\/XE/sonar\.jdbc\.url=jdbc:postgresql:\/\/localhost:5432\/sonarqube/' $SONAR_PROPER && \

# sudo sed -i 's/^#RUN_AS_USER=.*/RUN_AS_USER=sonar/' $SONAR_SH &&  \

# sudo cp /tmp/sonar.service /etc/systemd/system/sonar.service && \

# sudo systemctl enable sonar && \
# sudo systemctl start sonar && \


# echo "vm.max_map_count=262144" >> $SYST_CTL && \
# echo "fs.file-max=65536" >> $SYST_CTL && \
# echo "ulimit -n 65536" >> $SYST_CTL && \
# echo "ulimit -u 4096" >> $SYST_CTL 


echo "[12 - Finished Installation]"
