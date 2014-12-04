#!/bin/bash
# Install squid proxy with basic auth
# Required Docker 1.3 or higher!

# Remove old container
sudo docker stop squid-auth
sudo docker rm squid-auth

# Create password file
sudo mkdir -p /etc/squid-passwords
sudo touch /etc/squid-passwords/keys

# Create directory for additional rules
sudo mkdir -p /etc/squid-auth

# Create container
sudo docker create --name squid-auth -v /etc/squid-passwords:/passowrds -v /etc/squid-auth:/etc/squid3/conf.d/extra -p 3128:3128 squid auth

# Save upstart script
sudo curl https://raw.githubusercontent.com/reddec/squid/master/services/squid3-auth.conf -o /etc/init/squid3-auth.conf

echo "+--------------------------------------------------------------+"
echo "|                                                              |"
echo "|    Image: reddec/squid                                       |"
echo "|  Product: Squid 3 proxy (with basic auth)                    |"
echo "|   Status: installed                                          |"
echo "|                                                              |"
echo "|    start: sudo service squid3-auth start                     |"
echo "|     keys: /etc/squid-passwords/keys                          |"
echo "|                                                              |"
echo "| add user: sudo htpasswd /etc/squid-passwords/keys <username> |"
echo "+--------------------------------------------------------------+"
