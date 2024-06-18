#!/bin/bash

# Update package list
sudo apt-get update

# Install systemd-timesyncd if not already installed
sudo apt-get install -y systemd-timesyncd

# Configure systemd-timesyncd to use time.google.com
echo "[Time]" | sudo tee /etc/systemd/timesyncd.conf > /dev/null
echo "NTP=time.google.com" | sudo tee -a /etc/systemd/timesyncd.conf > /dev/null

# Restart systemd-timesyncd service
sudo systemctl restart systemd-timesyncd

# Enable systemd-timesyncd service to start on boot
sudo systemctl enable systemd-timesyncd

# Display status of systemd-timesyncd
sudo systemctl status systemd-timesyncd