#!/bin/bash

# Unix-based Secunetcon

chmod +x config.sh

# Network Settings
sudo ifconfig eth0 down # Mask IPv4 and IPv6 addresses

# Network Configuration
sudo ifconfig eth0 inet 127.0.0.1 # Assign localhost IPv4 address
sudo ifconfig eth0 inet6 add ::1/128 # Assign localhost IPv6 address
sudo nmcli con mod eth0 ipv4.dns "127.0.0.1" # Set primary DNS to localhost IPv4 address
sudo nmcli con mod eth0 ipv6.dns "::1" # Set secondary DNS to localhost IPv6 address

# Hostname
sudo hostnamectl set-hostname 127.0.0.1 # Change hostname to localhost

# MAC Address
sudo ifconfig eth0 hw ether 00:00:00:00:00:00 # Change MAC address to all zeros

# Bluetooth Address
sudo hciconfig hci0 down # Disable Bluetooth interface
sudo hciconfig hci0 up # Enable Bluetooth interface
sudo hciconfig hci0 name localhost # Change Bluetooth name
sudo hciconfig hci0 piscan # Enable Bluetooth discovery

# Location Services
sudo systemctl stop ModemManager # Disable location and geolocation

# Firewall
sudo iptables -A OUTPUT -p icmp --icmp-type echo-request -j DROP # Close pings
sudo iptables -A INPUT -j DROP # Block all ingress traffic

# Browser Cleanup
google-chrome --clear-cache --clear-cookies &> /dev/null # Clear browser cookies and cache for Chrome
firefox --clear-cache --clear-cookies &> /dev/null # Clear browser cookies and cache for Firefox
brave-browser --clear-cache --clear-cookies &> /dev/null # Clear browser cookies and cache for Brave
vivaldi --clear-cache --clear-cookies &> /dev/null # Clear browser cookies and cache for Vivaldi
chromium --clear-cache --clear-cookies &> /dev/null # Clear browser cookies and cache for Chromium
ddg-browser --clear-cache --clear-cookies &> /dev/null # Clear browser cookies and cache for DuckDuckGo

# Disk Encryption
sudo apt-get install -y cryptsetup # Install cryptsetup
sudo cryptsetup luksOpen /dev/sdX cryptdisk # Open LUKS encrypted disk
sudo mkfs.ext4 /dev/mapper/cryptdisk # Create filesystem on encrypted disk
sudo mount /dev/mapper/cryptdisk /mnt # Mount encrypted disk

# Browser Encryption
mkdir ~/.mozilla/firefox/encrypted-profile # Create encrypted Firefox profile directory
encfs ~/.mozilla/firefox/encrypted-profile ~/.mozilla/firefox/profile # Mount encrypted Firefox profile
mv ~/.mozilla/firefox/profile ~/.mozilla/firefox/plain-profile # Move existing Firefox profile to plain directory
ln -s ~/.mozilla/firefox/encrypted-profile ~/.mozilla/firefox/profile # Link encrypted profile to Firefox profile directory
mkdir ~/.config/google-chrome/encrypted-profile # Create encrypted Chrome profile directory
encfs ~/.config/google-chrome/encrypted-profile ~/.config/google-chrome/Default # Mount encrypted Chrome profile
mv ~/.config/google-chrome/Default ~/.config/google-chrome/plain-profile # Move existing Chrome profile to plain directory
ln -s ~/.config/google-chrome/encrypted-profile ~/.config/google-chrome/Default # Link encrypted profile to Chrome profile directory
mkdir ~/.config/brave-browser/encrypted-profile # Create encrypted Brave profile directory
encfs ~/.config/brave-browser/encrypted-profile ~/.config/brave-browser/Default # Mount encrypted Brave profile
mv ~/.config/brave-browser/Default ~/.config/brave-browser/plain-profile # Move existing Brave profile to plain directory
ln -s ~/.config/brave-browser/encrypted-profile ~/.config/brave-browser/Default # Link encrypted profile to Brave profile directory
mkdir ~/.config/vivaldi/encrypted-profile # Create encrypted Vivaldi profile directory
encfs ~/.config/vivaldi/encrypted-profile ~/.config/vivaldi/Default # Mount encrypted Vivaldi profile
mv ~/.config/vivaldi/Default ~/.config/vivaldi/plain-profile # Move existing Vivaldi profile to plain directory
ln -s ~/.config/vivaldi/encrypted-profile ~/.config/vivaldi/Default # Link encrypted profile to Vivaldi profile directory
mkdir ~/.config/duckduckgo-browser/encrypted-profile # Create encrypted DuckDuckGo profile directory
encfs ~/.config/duckduckgo-browser/encrypted-profile ~/.config/duckduckgo-browser/Default # Mount encrypted DuckDuckGo profile
mv ~/.config/duckduckgo-browser/Default ~/.config/duckduckgo-browser/plain-profile # Move existing DuckDuckGo profile to plain directory
ln -s ~/.config/duckduckgo-browser/encrypted-profile ~/.config/duckduckgo-browser/Default # Link encrypted profile to DuckDuckGo profile directory

# Secunetcon. Copyright © 2024. Joseph D. Smith. Licensed under Apache 2.0
