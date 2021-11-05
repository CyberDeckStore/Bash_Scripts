# Off-Grid
Bash Script designed to help automate deployment of Off-Grid CyberDeck.

*This script was developed and tested on a Raspberry Pi 4 running Raspbian v10 (buster).*

Script requires the following input:
* Default IP (Static IP Address)
* External Hard Drive - Filepath to Parent Directory of Websites
* Website Domain Name


Example: ./off-grid.sh -i 192.168.1.10 -d "/media/USER/Off Grid/www" -s cyberdeck.store



Steps to Install and Run

1. Download the script specific to your build.

1. Permit file to be executed.

   1. example: "sudo chmod +x off-grid.sh"

1. Run the script.

   1. example: "./off-grid.sh -h"
