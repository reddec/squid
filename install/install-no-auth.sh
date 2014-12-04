#!/bin/bash
# Install squid proxy without auth
# Required Docker 1.3 or higher!

# Remove old container
sudo docker stop squid-noauth
sudo docker rm squid-noauth

# Creates directory for additional configurations files
sudo mkdir -p /etc/squid-noauth

# Create container
sudo docker create --name squid-noauth -p 3128:3128 -v /etc/squid-noauth:/etc/squid3/conf.d/extra reddec/squid noauth

# Save upstart script
sudo curl https://raw.githubusercontent.com/reddec/squid/master/services/squid3-noauth.conf -o /etc/init/squid3-noauth.conf

echo "+------------------------------------------------------+"
echo "|                                                      |"
echo "|   Image: reddec/squid                                |"
echo "| Product: Squid 3 proxy (without auth)                |"
echo "|  Status: installed                                   |"
echo "|   Rules: /etc/squid-noauth                           |"
echo "|                                                      |"
echo "|   start: sudo service squid3-noauth start            |"
echo "|                                                      |"
echo "+------------------------------------------------------+"
