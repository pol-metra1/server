Базовая установка LAMP сервера (Apache, PHP, Mysql, Postgresql).  
Установка в Ubuntu, Debian.  
sudo apt install unzip  
cd ~  
wget https://github.com/pol-metra1/server/archive/refs/heads/main.zip  
unzip main.zip  
sudo sh server-main/install.sh  

Альтернативная установка  
sudo apt install git  
git clone https://github.com/pol-metra1/server.git  
sudo sh server/install.sh  

Установка Docker, Docker-compose и настройка portainer  
sudo apt install git  
git clone https://github.com/pol-metra1/server.git  
sudo sh server/install_docker.sh  
