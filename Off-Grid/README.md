# Off-Grid
###!Still In Development! // Please Don't Use Script Until We Give the O.K. on our blog!
Bash Script designed to help automate deployment of Off-Grid CyberDeck running off Raspbian.

Facilitates offline hosting for downloaded websites, file sharing via HTTP, Wiki reader and FreeTAKServer for offering map packages.

Installs and configures the following software to run in conjuction with OS installed on SD card and External M.2 drive plugged in via USB:
* Apache 2 - Multi-Site Config -> Symlink to Ext. Drive / Sub-Function to add new sites.
* KiwiX - Install + Inital Config / Sub-Function to append service config with new ZIM files.
* FreeTAKServer - Install + Partial Config

*This script requires internet access to download updated software.*

>Developed and tested on a Raspberry Pi 4 running Raspbian v10 (buster).

## Steps to Install and Run

1. Download the script specific to your build.

1. Permit file to be executed.

   1. example: ```sudo chmod +x off-grid.sh```

1. Run the script.

   1. example: ```./off-grid.sh -h```

## Script requires the following input:
* Default IP (Static IP Address)
* External Hard Drive - Filepath to Parent Directory of Websites
* Website Domain Name

Example: ```./off-grid.sh -i 192.168.1.10 -d "/media/USER/Off Grid/www" -s cyberdeck.store```

## Example File Structure
This is a basic overview of how the file structure is expected to be setup on the External Hard Drive.

We used a M.2 NvME 1Tb drive connected via a USB 3.0 reader. I named our drive "Off Grid" as seen in the examples.

Folders in root of drive:
* web (Name folders after URL of downloaded site, ex: "www.survivorlibrary.com")
* files (Folders here are offered as downloadable via HTTP)
* wiki (Storage location for ZIM files)
* maps

## Intranet Portal
I'm offering the Intranet Portal we created as a starting point to navigate to each hosted software.

This site will be added via the initial script, navigate to www.file.store for local access.

> The Intranet is a Work in Progress.

## Special Considerations

__In order to serve the content hosted by your CyberDeck to other devices on your network, that network needs to have internet access disabled!__
