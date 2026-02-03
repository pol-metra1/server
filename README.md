Базовая установка LAMP сервера (Apache, PHP, Mysql, Postgresql):  
Установка в Ubuntu, Debian.  
sudo apt update  
sudo apt install unzip  
cd ~  
wget https://github.com/pol-metra1/server/archive/refs/heads/main.zip  
unzip main.zip  
sudo sh server-main/install.sh  

Альтернативная установка  
sudo apt update  
sudo apt install git  
git clone https://github.com/pol-metra1/server.git  
sudo sh server/install.sh  

Установка Docker, Docker-compose и настройка portainer:  
Установка в Ubuntu.  
sudo apt update   
sudo apt install unzip   
cd ~   
wget https://github.com/pol-metra1/server/archive/refs/heads/main.zip  
unzip main.zip  
sudo sh server-main/install_docker.sh  
  
Альтернативная установка   
sudo apt update  
sudo apt install git  
git clone https://github.com/pol-metra1/server.git  
sudo sh server/install_docker.sh  
