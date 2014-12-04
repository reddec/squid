squid
=====

Docker (at least 1.3) image for Squid3 with or without basic auth

Build
=====


# Create containers

### Without auth

`sudo docker create --name squid-noauth -p 3128:3128 squid noauth`

### With auth

`sudo docker create --name squid-auth -v /etc/squid-passwords:/passowrds -p 3128:3128 squid auth`

#### Add users

Install `apache2-utils`

`sudo htpasswd -c /etc/squid-passwords/keys <username>`

# Start up scripts (UPSTART)

### Without auth

`sudo cp squid3-noauth.conf /etc/init/`

start by

`sudo service squid3-noauth start`

### With auth

`sudo cp squid3-auth.conf /etc/init/`

start by

`sudo service squid3-auth stop`
