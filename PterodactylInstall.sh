#!/bin/bash
#Complete installation
#Prerequisites

sudo apt-get update 
sudo apt-get -y upgrade 
sudo apt-get -y dist-upgrade
sudo apt -y install software-properties-common curl apt-transport-https ca-certificates gnupg
sudo LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
sudo add-apt-repository -y ppa:chris-lea/redis-server
sudo apt install -y net-tools
sudo apt install -y expect
sudo curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash
sudo apt-get update 
sudo apt-get -y upgrade 
sudo apt-get -y dist-upgrade
sudo apt install -y php8.0 
sudo apt install -y php8.0-cli
sudo apt install -y php8.0-gd
sudo apt install -y php8.0-mysql
sudo apt install -y php8.0-pdo
sudo apt install -y php8.0-mbstring
sudo apt install -y php8.0-tokenizer
sudo apt install -y php8.0-bcmath
sudo apt install -y php8.0-xml
sudo apt install -y php8.0-fpm
sudo apt install -y php8.0-curl
sudo apt install -y php8.0-zip
sudo apt install -y mariadb-server
sudo apt install -y nginx
sudo apt install -y tar
sudo apt install -y unzip 
sudo apt install -y git 
sudo apt install -y redis-server
sudo curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
sudo mkdir -p /var/www/pterodactyl
cd /var/www/pterodactyl
sudo curl -Lo panel.tar.gz https://github.com/pterodactyl/panel/releases/latest/download/panel.tar.gz
sudo tar -xzvf panel.tar.gz
sudo chmod -R 755 storage/* bootstrap/cache/
sudo cp .env.example .env
yes | sudo composer install --no-dev --optimize-autoloader
sudo php artisan key:generate --force
intip=$(hostname -I)
extip=$(curl ipinfo.io/ip)
sudo wget https://github.com/ventshek/Bash/raw/main/proc.exp
sudo chmod +x proc.exp
sudo ./proc.exp "$intip"
sudo rm ./proc.exp
sudo wget https://github.com/ventshek/Bash/raw/main/redis.conf
sudo cp -f ./redis.conf /etc/redis/redis.conf
sudo rm ./redis.conf
sudo chown -R redis:redis /etc/redis/redis.conf
sudo wget https://github.com/ventshek/Bash/raw/main/cli.exp
sudo chmod +x cli.exp
sudo ./cli.exp Defaultpassword1
sudo rm cli.exp
sudo wget https://github.com/ventshek/Bash/raw/main/mysql.exp
sudo chmod +x mysql.exp
sudo ./mysql.exp
sudo rm mysql.exp
sudo wget https://github.com/ventshek/Bash/raw/main/my.cnf
sudo cp -f ./my.cnf /etc/mysql/my.cnf
sudo rm ./my.cnf
cd /var/www/pterodactyl
sudo wget https://github.com/ventshek/Bash/raw/main/database.exp
sudo chmod +x database.exp
sudo ./database.exp
sudo rm ./database.exp
cd /var/www/pterodactyl
sudo wget https://github.com/ventshek/Bash/raw/main/mail.exp
sudo chmod +x mail.exp
sudo ./mail.exp
sudo rm ./mail.exp
cd /var/www/pterodactyl
sudo php artisan migrate --seed --force
sudo wget https://github.com/ventshek/Bash/raw/main/user.exp
sudo chmod +x user.exp
sudo ./user.exp
sudo rm ./user.exp
cd
sudo chown -R www-data:www-data *
