#Complete installation
#Prerequisites

sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade
sudo apt -y install software-properties-common curl apt-transport-https ca-certificates gnupg
sudo LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
sudo add-apt-repository -y ppa:chris-lea/redis-server
sudo apt install -y net-tools
sudo curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash
sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade
sudo apt -y install php8.0 php8.0-{cli,gd,mysql,pdo,mbstring,tokenizer,bcmath,xml,fpm,curl,zip} mariadb-server nginx tar unzip git redis-server
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
cd
sudo wget https://github.com/ventshek/Bash/raw/main/redis.conf
sudo cp -f ./redis.conf /etc/redis/redis.conf
sudo rm ./redis.conf
sudo chown -R redis:redis /etc/redis/redis.conf
sudo wget https://github.com/ventshek/Bash/raw/main/cli.exp
sudo chmod +x cli.exp
sudo ./cli.exp
sudo rm cli.exp
sudo wget https://github.com/ventshek/Bash/raw/main/mysql.exp
sudo chmod +x mysql.exp
sudo ./mysql.exp
sudo rm mysql.exp











