#!/bin/bash

# Define colors
NC='\033[0m'            # No Color
Black='\033[0;30m'      # Black
Red='\033[0;31m'        # Red
Green='\033[0;32m'      # Green
Yellow='\033[0;33m'     # Yellow
Blue='\033[0;34m'       # Blue
Purple='\033[0;35m'     # Purple
Cyan='\033[0;36m'       # Cyan
White='\033[0;37m'      # White

#define line
line="${Purple}===============================================================================${NC}\n";

if [ "$1" == "" ]; then
    printf $line;
    printf "\tUsage mode:\n\t$ ${0} example.com\n";
    printf $line;
    exit;
fi;

printf $line;
printf "\t${Green}[+] Fetching all links from${NC} ${Blue}$1${NC}\n";
printf $line;

tmpHtml=$(curl -s "$1")

links=$(echo $tmpHtml | tr -t ">" "\n" | grep href | cut -d '/' -f3 | grep '^[a-zA-Z0-9:]*\.[a-zA-Z0-9:]' | tr -d "\"");

printf "\t${Green}Hostname${NC}\t\t\t\t${Green}IP${NC}\n";
printf $line;

for link in $(echo $links | tr -t " " "\n"); do
    host=$(host google.com | grep "has address" | cut -d " " -f4);

    printf "\t$host\t\t\t\t$link\n";
done;
printf $line;
