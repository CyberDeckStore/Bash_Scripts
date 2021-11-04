#!/bin/bash
# CyberDeck Store - Hi-Tech LowLife
# Off-Grid Bash Script v0.01
# RoadMap:
# - Apache Server (ext. HDD + Multi_Sites)
# - KiwiX Server (startup script for ext. HDD)
# - FreeTAK Server

############################################################
# Help                                                     #
############################################################
Help()
{
   # Display Help
   echo "Add description of the script functions here."
   echo
   echo "Syntax: scriptTemplate [-d|s|h]"
   echo "options:"
   echo "d     External drive filepath, i.e. '/usr/media/Off Grid'."
   echo "s     Add website to multi-domain setup." 
   echo "h     Print this Help."
   echo
}

############################################################
############################################################
# Main program                                             #
############################################################
############################################################

# Program variables
HardDrive="/usr/media/Off Grid"
WebSite="www.file.store"

############################################################
# Process the input options. Add options as needed.        #
############################################################
# Grab input options
while getopts ":h" option; do
   case $option in
      h) # display Help
         Help
         exit;;
     \?) # Invalid option
         echo "Error: Invalid option"
         exit;;
   esac
done

echo -e "\e[93m   _____      _               _____            _       _____ _                 \e[0m";
echo -e "\e[93m  / ____|    | |             |  __ \          | |     / ____| |                \e[0m";
echo -e "\e[93m | |    _   _| |__   ___ _ __| |  | | ___  ___| | __ | (___ | |_ ___  _ __ ___ \e[0m";
echo -e "\e[93m | |   | | | | '_ \ / _ \ '__| |  | |/ _ \/ __| |/ /  \___ \| __/ _ \| '__/ _ \ \e[0m";
echo -e "\e[93m | |___| |_| | |_) |  __/ |  | |__| |  __/ (__|   <   ____) | || (_) | | |  __/\e[0m";
echo -e "\e[93m  \_____\__, |_.__/ \___|_|  |_____/ \___|\___|_|\_\ |_____/ \__\___/|_|  \___|\e[0m";
echo -e "\e[93m         __/ |                                                                 \e[0m";
echo -e "\e[93m        |___/                                                                  \e[0m";
echo " "                                                                                                      
sleep 1
echo " "
echo -e "\e[34m_   _ ____ _  _ ____ \e[0m";
echo -e "\e[34m \_/  |  | |  | |__/ \e[0m";
echo -e "\e[34m  |   |__| |__| |  \ \e[0m";
echo -e "\e[34m                     \e[0m";
echo " " 
echo -e "\e[95m    __  ___     ______          __       __                  __    _ ____   \e[0m";
echo -e "\e[95m   / / / (_)   /_  __/__  _____/ /_     / /   ____ _      __/ /   (_) __/__ \e[0m";
echo -e "\e[95m  / /_/ / /_____/ / / _ \/ ___/ __ \   / /   / __ \ | /| / / /   / / /_/ _ \ \e[0m";
echo -e "\e[95m / __  / /_____/ / /  __/ /__/ / / /  / /___/ /_/ / |/ |/ / /___/ / __/  __/\e[0m";
echo -e "\e[95m/_/ /_/_/     /_/  \___/\___/_/ /_/  /_____/\____/|__/|__/_____/_/_/  \___/ \e[0m";
echo -e "\e[95m                                                                            \e[0m";
echo " "
sleep 2
echo " " 
echo -e "\e[34m___  ____ ____ ____ ____ _  _ ___ ____ \e[0m";
echo -e "\e[34m|__] |__/ |___ [__  |___ |\ |  |  [__  \e[0m";
echo -e "\e[34m|    |  \ |___ ___] |___ | \|  |  ___] \e[0m";
echo -e "\e[34m                                       \e[0m";
echo " "                                                                                                 
sleep 1
echo " " 
echo -e "\e[91m                                                                             \e[0m";
echo -e "\e[91m   _|_|        _|_|      _|_|                _|_|_|            _|        _|  \e[0m";
echo -e "\e[91m _|    _|    _|        _|                  _|        _|  _|_|        _|_|_|  \e[0m";
echo -e "\e[91m _|    _|  _|_|_|_|  _|_|_|_|  _|_|_|_|_|  _|  _|_|  _|_|      _|  _|    _|  \e[0m";
echo -e "\e[91m _|    _|    _|        _|                  _|    _|  _|        _|  _|    _|  \e[0m";
echo -e "\e[91m   _|_|      _|        _|                    _|_|_|  _|        _|    _|_|_|  \e[0m";
echo -e "\e[91m                                                                             \e[0m";
echo "                                                                             ";
sleep 2
echo "This script will assist with installing server-side software on your CyberDeck."
echo "Please follow the prompts to customize your setup."

