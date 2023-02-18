#!/bin/bash

LOGFILE=~/startup.log;
echo "" >> $LOGFILE;
echo "------------- STARTING NEW LOG -------------" >> $LOGFILE;

# Install Python 3.10 if not installed
datetime=$(date '+%d/%m/%Y %H:%M:%S');
echo $datetime "- Running install_python3.10" >> $LOGFILE
if ! command -v python3.10 &> /dev/null
then
    echo $datetime "- Python 3.10 could not be found" >> $LOGFILE
    echo $datetime "- Installing Python 3.10" >> $LOGFILE
    sudo apt update && sudo apt upgrade -y
    sudo apt install software-properties-common -y
    sudo add-apt-repository ppa:deadsnakes/ppa
    sudo apt install python3.10 -y
else
    echo $datetime "- Python 3.10 already installed" >> $LOGFILE
fi

# Install pip if not installed
echo $datetime "- Running install_pip" >> $LOGFILE
if ! command -v pip &> /dev/null
then
    echo $datetime "- pip could not be found" >> $LOGFILE
    echo $datetime "- Installing pip" >> $LOGFILE
    echo "pip could not be found"
    echo "Installing pip"
    sudo apt update && sudo apt upgrade -y
    sudo apt install python3-pip -y

    sudo apt-get update -y
    sudo apt install python3-pip -y

    echo $datetime "- Finished installing and updating pip" >> $LOGFILE
else
    echo $datetime "- pip already installed, updating pip" >> $LOGFILE
    sudo apt update && sudo apt upgrade -y
    echo $datetime "- Finished updating pip" >> $LOGFILE
fi

# Install pipenv if not installed
echo $datetime "- Running install_pipenv" >> $LOGFILE
if ! command -v pipenv &> /dev/null
then
    echo $datetime "- pipenv could not be found" >> $LOGFILE
    echo $datetime "- Installing pipenv" >> $LOGFILE
    sudo apt update && sudo apt upgrade -y
    sudo apt install python3-pip -y
    pip install pipenv
    echo $datetime "- Finished installing pipenv" >> $LOGFILE
else
    echo $datetime "- pipenv already installed" >> $LOGFILE
fi

# Install git if not installed
echo $datetime "- Running install_git" >> $LOGFILE
if ! command -v git &> /dev/null
then
    echo $datetime "- git could not be found" >> $LOGFILE
    echo $datetime "- Installing git" >> $LOGFILE
    sudo apt update && sudo apt upgrade -y
    sudo apt install git -y
    echo $datetime "- Finished installing git" >> $LOGFILE
else
    echo $datetime "- git already installed" >> $LOGFILE
fi


# # clone the repository https://github.com/fnsalinas/consumidos_datos_sinteticos.git on main folder if not exists else update it
# echo $datetime "- Running clone_or_update_repository" >> $LOGFILE
# if [ -d "~/consumidos_datos_sinteticos" ]; then
#     echo $datetime "- ~/consumidos_datos_sinteticos already exists" >> $LOGFILE
#     cd ~/consumidos_datos_sinteticos/
#     git pull;
#     echo $datetime "- Finished updating ~/consumidos_datos_sinteticos" >> $LOGFILE
# else
#     echo $datetime "- ~/consumidos_datos_sinteticos does not exist" >> $LOGFILE
#     echo $datetime "- Cloning" >> $LOGFILE
#     git clone https://github.com/fnsalinas/consumidos_datos_sinteticos.git
#     cd ~/consumidos_datos_sinteticos/
#     echo $datetime "- Finished cloning" >> $LOGFILE
# fi

# echo $datetime "- Running add to bashrc" >> $LOGFILE
# if grep -q "CUSTOM SCRIPTS" ~/.bashrc; then
#     echo "CUSTOM SCRIPTS already exists in ~/.bashrc"
# else
#     echo "CUSTOM SCRIPTS does not exist in ~/.bashrc"
#     echo "" >> ~/.bashrc
#     echo "" >> ~/.bashrc
#     echo "" >> ~/.bashrc
#     echo "# ----------- CUSTOM SCRIPTS -----------" >> ~/.bashrc
#     echo "" >> ~/.bashrc
#     echo "" >> ~/.bashrc
#     echo "" >> ~/.bashrc
#     echo "alias python='python3'" >> ~/.bashrc
# fi

echo $datetime "- Running source ~/.bashrc" >> $LOGFILE
source ~/.bashrc;
cd ~/consumidos_datos_sinteticos;

# Install dependencies if the actual foldername is consumidos_datos_sinteticos, if not, exit
echo $datetime "- Running install_dependencies" >> $LOGFILE
if [ "${PWD##*/}" = "consumidos_datos_sinteticos" ]; then
    echo $datetime "- Installing dependencies" >> $LOGFILE
    echo $datetime "- Running pipenv install" >> $LOGFILE
    pipenv install;

    echo $datetime "- Running pipenv install -r requirements.txt" >> $LOGFILE
    pipenv install -r requirements.txt;

    echo $datetime "- Running pipenv install -e ." >> $LOGFILE
    pipenv install -e .;
else
    echo $datetime "- The actual foldername is not consumidos_datos_sinteticos, exiting" >> $LOGFILE
    exit 1
fi

# # get public ip from http://checkip.amazonaws.com and save it in a variable
# echo $datetime "- Running get_public_ip" >> $LOGFILE
# PUBLIC_IP=$(curl http://checkip.amazonaws.com)
# echo $datetime "- Public IP: $PUBLIC_IP" >> $LOGFILE

# # install nginx if not installed
# echo $datetime "- Running install_nginx" >> $LOGFILE
# if ! command -v nginx &> /dev/null
# then
#     echo $datetime "- nginx could not be found" >> $LOGFILE
#     echo $datetime "- Installing nginx" >> $LOGFILE
#     sudo apt update && sudo apt upgrade -y
#     sudo apt install nginx -y
    
#     echo $datetime "- Configuring nginx" >> $LOGFILE
#     sudo ufw app list
#     sudo ufw allow 'Nginx HTTP'
    
#     echo $datetime "- writing nginx config with public ip: $PUBLIC_IP into /etc/nginx/sites-enabled/fastapi_nginx" >> $LOGFILE
#     sudo echo "server {
#         listen 80;
#         server_name $PUBLIC_IP;
#         location / {
#             proxy_pass http://127.0.0.1:8000;
#         }
#     }" > /etc/nginx/sites-enabled/fastapi_nginx
#     sudo service nginx restart
#     echo $datetime "- nginx configuration file data: " >> $LOGFILE
#     echo $(cat /etc/nginx/sites-enabled/fastapi_nginx) >> $LOGFILE
#     echo $datetime "- nginx configured and restarted successfully" >> $LOGFILE
# else
#     echo $datetime "- nginx already installed" >> $LOGFILE
#     echo $datetime "- Configuring nginx" >> $LOGFILE
#     echo $datetime "- writing nginx config with public ip: $PUBLIC_IP into /etc/nginx/sites-enabled/fastapi_nginx" >> $LOGFILE
#     sudo echo "server {
#         listen 80;
#         server_name $PUBLIC_IP;
#         location / {
#             proxy_pass http://127.0.0.1:8000;
#         }
#     }" > /etc/nginx/sites-enabled/fastapi_nginx
#     sudo service nginx restart
#     echo $datetime "- nginx configuration file data: " >> $LOGFILE
#     echo $(cat /etc/nginx/sites-enabled/fastapi_nginx) >> $LOGFILE
# fi

# # run the application ~/consumidos_datos_sinteticos/sh/run_app.sh if the actual foldername is consumidos_datos_sinteticos, if not, exit
# echo $datetime "- Running run_app" >> $LOGFILE
# if [ "${PWD##*/}" = "consumidos_datos_sinteticos" ]; then
#     echo $datetime "- Running ~/consumidos_datos_sinteticos/sh/run_app.sh" >> $LOGFILE
#     bash ~/consumidos_datos_sinteticos/sh/run_app.sh
# else
#     echo $datetime "- The actual foldername is not consumidos_datos_sinteticos, exiting" >> $LOGFILE
#     exit 1
# fi

