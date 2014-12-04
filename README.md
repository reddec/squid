squid
=====

Docker (at least 1.3) image for Squid3 with or without basic auth

Tested on Ubuntu 14.04 x64 LTS

Install scrips:

**No auth**

     bash <(curl https://raw.githubusercontent.com/reddec/squid/master/install/install-no-auth.sh)

**With basic auth**

     bash <(curlhttps://raw.githubusercontent.com/reddec/squid/master/install/install-with-auth.sh)

Location for custom configuration files:

    /etc/squid-[no]auth/*.conf

----------

Build
=====

# With basic authentication

#### Create containers

```bash
sudo docker create --name squid-auth -v /etc/squid-passwords:/passowrds -p 3128:3128 reddec/squid auth
```
    
##### Add users. Required `apache2-utils`

```bash
sudo htpasswd -c /etc/squid-passwords/keys <username>
```

##### Add upstart script

```bash
sudo curl https://raw.githubusercontent.com/reddec/squid/master/services/squid3-auth.conf > /etc/init/squid3-auth.conf
```

##### Start service

```bash
sudo service squid3-auth start
```

# Without authentication

##### Create containers

```bash
sudo docker create --name squid-noauth -p 3128:3128 reddec/squid noauth
```
 
##### Add upstart script

```bash
sudo curl https://raw.githubusercontent.com/reddec/squid/master/services/squid3-noauth.conf >/etc/init/squid3-noauth.conf
```
 
##### Start service

```bash
sudo service squid3-noauth start
```
