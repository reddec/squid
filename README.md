squid
=====

Docker (at least 1.3) image for Squid3 with or without basic auth

Tested on Ubuntu 14.04 x64 LTS

Install scrips:

**No auth**

     bash <(curl https://raw.githubusercontent.com/reddec/squid/master/install/install-no-auth.sh)

**With basic auth**

     bash <(curlhttps://raw.githubusercontent.com/reddec/squid/master/install/install-with-auth.sh)


----------

Build
=====

# With basic authentication

1. Create containers

```bash
sudo docker create --name squid-auth -v /etc/squid-passwords:/passowrds -p 3128:3128 reddec/squid auth
```
    
2. Add users. Required `apache2-utils`

```bash
sudo htpasswd -c /etc/squid-passwords/keys <username>
```

3. Add upstart script

```bash
sudo curl https://raw.githubusercontent.com/reddec/squid/master/services/squid3-auth.conf > /etc/init/squid3-auth.conf
```

4. Start service

```bash
sudo service squid3-auth start
```

# Without authentication

1. Create containers

```bash
sudo docker create --name squid-noauth -p 3128:3128 reddec/squid noauth
```
 
2. Add upstart script

```bash
sudo curl https://raw.githubusercontent.com/reddec/squid/master/services/squid3-noauth.conf >/etc/init/squid3-noauth.conf
```
 
3. Start service

```bash
sudo service squid3-noauth start
```
