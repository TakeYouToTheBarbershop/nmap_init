#!/bin/bash

target=$1

RED='\033[0;30m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

echo -e "$YELLOW[-] Running initial Nmap scan...$NC"

if [ ! -d "$target" ];then
	mkdir $target
fi

if [ ! -d "$target/recon" ];then
	mkdir $target/recon
fi

nmap -p- -T4 -v -oN $target/recon/nmap_initial.txt $target

echo -e "$GREEN[x] Initial Nmap scan finished! $NC"
echo "$YELLOW[-] Running Nmap script scan...$NC"

nmap -p- -T4 -v -sC -sV -oN $target/recon/nmap_script.txt $target

echo -e "$GREEN[x] Nmap Script scan finished! $NC"
