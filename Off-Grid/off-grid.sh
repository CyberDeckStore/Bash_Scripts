#!/bin/bash
# CyberDeck Store - Hi-Tech LowLife
# Off-Grid Bash Script v0.30
# RoadMap:
# - Apache Server (ext. HDD + Multi_Sites) - Automate permissions for viewing Ext. HDD file directory via browser
# - KiwiX Server (startup script for ext. HDD)
# - FreeTAK Server (Install, Config, AutoService)

############################################################
# Help                                                     #
############################################################
Help()
{
# Display Help
echo "This script is designed to help finish setting up your Off-Grid CyberDeck."
echo "Input needed: Static IP, FilePath to EXT. HDD, Website Domain, FilePath to ZIM Wiki.
echo
echo "Syntax: scriptTemplate [-i|d|s|S|Z|h]"
echo "options:"
echo "i     Default IP Address, this should be the static IP address for your CyberDeck. ex: 192.168.8.243"   
echo "d     External drive parent directory of website filepath, ex: \"/media/USER/Off Grid/web\"."
echo "s     Include 1st site domain name during initial setup. ex: -s website1.com"
echo "S     Sub-Script to add new website to multi-domain setup, use this option after initial setup. ex: -S website2.com" 
echo "Z     Sub-Script to add new ZIM file to KiwiX, use this option after initial setup. ex: -Z \"media/USER/Off Grid/wiki/wikipedia_en_all_maxi_2020-11.zim\"."
echo "h     Print this Help."
echo
}

############################################################
# Add New Site                                             #
############################################################
Site()
{
#Add New Multi-Site Entry
echo "This script is designed to help finish setting up your Off-Grid CyberDeck."
echo "This option will add a new site to your Multi-Site Apache Setup."
echo
#Request Input / Parse Variables
echo "Please enter in your domain name, ex: website.com ."
read Website
#Parsing directory name from domain name
IFS='.' read -ra ADDR <<< "$Website"
WebDir=$ADDR
echo "Please enter in your Static IP."
read DefaultIP
echo "Please enter in your external harddrive website parent directory filepath, ex: /media/USER/Off Grid/web ."
read HardDrive
echo "Configuring New Site..."

#Creating New Local Directory based on user input
sudo mkdir /var/www/"$Website"

#Creating Apache Configuration file
sudo cat > /etc/apache2/sites-available/"$Website".conf << EOF
<VirtualHost *:80>
ServerName "$Website"
ServerAlias www."$Website"
DocumentRoot /var/www/"$WebDir"
</VirtualHost>
EOF

#Append Hosts File
sudo echo '"$DefaultIP" www."$Website"' >> /etc/hosts/

#Enable New Website
sudo a2ensite "$Website".conf

#NEED IF/ELSE CHECK FOR NO EXT HDD
#Ext. HDD and Setup Symlink/Permissions
sudo ln -s "'$HardDrive'/www.'$Website'" /var/www/"$WebDir"
sudo chmod o+x /media
sudo chmod o+x /media/"$USER"
sudo chmod o+x "$HardDrive"
sudo chmod o+x "$HardDrive"/www."$Website"

#Apache Restart
sudo service apache2 restart

echo "Apache Multi-Site Configuration Complete."
sleep 1
clear
}

############################################################
# Add New ZIM Wiki                                         #
############################################################
ZIM()
{
echo "Sub-Script Under Development"
}

############################################################
############################################################
# Main program                                             #
############################################################
############################################################

############################################################
# Program Variables                                        #
############################################################

DefaultIP="192.168.8.243"
HardDrive="/media/'$USER'/Off Grid/web"
Website="file.store"

#Parsing directory name from domain name
IFS='.' read -ra ADDR <<< "$Website"
WebDir=$ADDR

############################################################
# Process the input options                                #
############################################################
# Grab input options
while getopts ":hidsSZ" option; do
   case $option in
      h) # display Help
         Help
         exit;;     
      i) # Enter Default IP
         DefaultIP=$OPTARG;;
      d) # Enter filepath for ext harddrive
         HardDrive=$OPTARG;;
      s) # Enter initial multi-Site entry
         Website=$OPTARG;;
      S) # add new multi-Site entry
         Site
         exit;;         
      Z) # add new ZIM wiki
         ZIM
         exit;;
     \?) # Invalid option
         echo "Error: Invalid option"
         exit;;
   esac
done

# Pause Function
function pause(){
   read -p "$*"
}

clear
sleep 1

cat << "EOF"
\e[93m


   ____      _               ____            _      ____  _                 
  / ___|   _| |__   ___ _ __|  _ \  ___  ___| | __ / ___|| |_ ___  _ __ ___ 
 | |  | | | | '_ \ / _ \ '__| | | |/ _ \/ __| |/ / \___ \| __/ _ \| '__/ _ \
 | |__| |_| | |_) |  __/ |  | |_| |  __/ (__|   <   ___) | || (_) | | |  __/
  \____\__, |_.__/ \___|_|  |____/ \___|\___|_|\_\ |____/ \__\___/|_|  \___|
       |___/                                                                


\e
EOF
sleep 2
clear
cat << "EOF"
\e[34m

_   _ ____ _  _ ____ 
 \_/  |  | |  | |__/ 
  |   |__| |__| |  \ 
                     

\e 
\e[95m

    __  ___     ______          __       __                  __    _ ____   
   / / / (_)   /_  __/__  _____/ /_     / /   ____ _      __/ /   (_) __/__ 
  / /_/ / /_____/ / / _ \/ ___/ __ \   / /   / __ \ | /| / / /   / / /_/ _ \
 / __  / /_____/ / /  __/ /__/ / / /  / /___/ /_/ / |/ |/ / /___/ / __/  __/
/_/ /_/_/     /_/  \___/\___/_/ /_/  /_____/\____/|__/|__/_____/_/_/  \___/ 
                                                                            

\e
\e[34m

___  ____ ____ ____ ____ _  _ ___ ____ 
|__] |__/ |___ [__  |___ |\ |  |  [__  
|    |  \ |___ ___] |___ | \|  |  ___] 
                                       

\e
EOF
sleep 2
clear
cat << "EOF"
\e[91m                                                                             

                                                                             
   _|_|        _|_|      _|_|                _|_|_|            _|        _|  
 _|    _|    _|        _|                  _|        _|  _|_|        _|_|_|  
 _|    _|  _|_|_|_|  _|_|_|_|  _|_|_|_|_|  _|  _|_|  _|_|      _|  _|    _|  
 _|    _|    _|        _|                  _|    _|  _|        _|  _|    _|  
   _|_|      _|        _|                    _|_|_|  _|        _|    _|_|_|  
                                                                             
                                                                             

\e
EOF
sleep 2
echo "This script will assist with installing server-side software on your Off-Grid CyberDeck."
echo "Please follow the prompts to customize your setup."
sleep 1
pause 'Press [Enter] key to continue...'
clear

#####
# Linux Updates
#####
echo "Stage 1: Update Linux Distro and Dependencies."
echo "Installing Linux Updates and Dependencies."
sleep 2
sudo apt update && sudo apt upgrade -y
echo "Linux Update Complete."
sleep 1
pause 'Press [Enter] key to continue...'
clear

#####
# Apache Setup
#####
echo "Stage 2: Apache Install and Configure."
echo "Installing Apache."
sleep 2
sudo apt install apache2 -y
echo "Apache Install Complete."
sleep 2
clear
echo "Configuring Apache for Multi-Site Use."

#Change Dir permissions to allow Read/Write
sudo chown $USER /var/www/
sudo chown $USER /var/www/html

#Creating 1st Directory based on user input
sudo mkdir /var/www/"$Website"

#Creating Local Apache Configuration file
sudo cat > /etc/apache2/sites-available/"$Website".conf << EOF
<VirtualHost *:80>
ServerName "$Website"
ServerAlias www."$Website"
DocumentRoot /var/www/"$WebDir"
</VirtualHost>
EOF

#Append Hosts File
sudo echo '"$DefaultIP" www."$Website"' >> /etc/hosts/

#Disable Default Website
sudo a2dissite 000-default-conf

#Enable 1st Website
sudo a2ensite "$Website".conf

#NEED IF/ELSE CHECK FOR NO EXT HDD
#Ext. HDD and Setup Symlink/Permissions
sudo ln -s "'$HardDrive'/www.'$Website'" /var/www/"$WebDir"
sudo chmod o+x /media
sudo chmod o+x /media/"$USER"
sudo chmod o+x "$HardDrive"
sudo chmod o+x "$HardDrive"/www."$Website"

#Apache Restart
sudo service apache2 restart

echo "Apache Multi-Site Configuration Complete."
sleep 1
pause 'Press [Enter] key to continue...'
clear

#####
# KiwiX Setup
#####
echo "Stage 3: KiwiX Install and Configure."
echo "Downloading and Installing KiwiX."
sleep2
wget https://download.kiwix.org/release/kiwix-tools/kiwix-tools_linux-armhf.tar.gz
tar -zxvf kiwix-tools_linux-armhf.tar.gz
sudo rm kiwix-tools_linux-armhf.tar.gz
sudo mv kiwix-tools_linux-armhf/* /usr/local/bin
echo "KiwiX Install Complete."
sleep 2
clear
echo "Configuring KiwiX Service."
sleep 1

#Grab Input - Filepath for ZIM wikis
echo "Please enter in filepath to ZIM file. ex: '/media/USER/Off Grid/wiki/wikipedia_en_all_maxi_2020-11.zim' ."
read $ZIMFile

#Creating KiwiX Service File
sudo cat > /etc/systemd/system/kiwix.service << EOF
[Unit]
Description=Kiwix Service
After=network.target

[Service]
Type=simple
User=root
Group=root
ExecStart=/usr/local/bin/kiwix-serve "$ZIMFile" -p 8080
Restart=always
RestartSec=3

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl enable kiwix
sudo systemctl start kiwix

echo "KiwiX Configuration Complete."
echo "Navigate to test: http://localhost:8080/ ."
sleep 1
pause 'Press [Enter] key to continue...'
clear

#####
# FreeTAK Setup
#####
echo "Stage 4: FreeTAK Install and Configure."
sleep 2
clear

echo "Installing FreeTAKServer"
sleep 2

#Install FreeTAK UI via Python pip
sudo python3 -m pip install FreeTAKServer[ui]

echo "Install Complete"
sleep 2
clear

echo "Configuring FreeTAKServer"
sleep 2
#Edit Config file to use Python 3.7 and not 3.8
sudo sed -i 's/python3.8/python3.7/g' /usr/local/lib/python3.7/dist-packages/FreeTAKServer/controllers/configuration/MainConfig.py

#Start Server and UI - NOT HEADLESS
#sudo python3 -m FreeTAKServer.controllers.services.FTS
#sudo FLASK_APP=/usr/local/lib/python3.7/dist-packages/FreeTAKServer-UI/run.py python3 /usr/local/lib/python3.7/dist-packages/FreeTAKServer-UI/run.py

#Create Cron job to start FreeTAK server on reboot
sudo crontab -e
@reboot nohup sudo python3 -m FreeTAKServer.controllers.services.FTS &
@reboot nohup sudo FLASK_APP=/usr/local/lib/python3.7/dist-packages/FreeTAKServer-UI/run.py python3 /usr/local/lib/python3.7/dist-packages/FreeTAKServer-UI/run.py &

echo "Configuration Complete"
sleep 1
echo "Navigate to test: http://localhost:5000/ ."
pause 'Press [Enter] key to continue...'
clear

#Reboot Linux
#sudo reboot
echo "Please Run FreeTAKServer Config and Reboot your CyberDeck for changes to take affect."
sleep 1
pause 'Press [Enter] key to continue...'
sudo python3 -m FreeTAKServer.controllers.services.FTS
