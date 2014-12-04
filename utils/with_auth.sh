#!/bin/bash
AUTH=/etc/squid3/conf.d/disabled/auth.conf
NOAUTH=/etc/squid3/conf.d/enabled/noauth.conf
if [ -f $AUTH ]
then
  mv $AUTH /etc/squid3/conf.d/enabled/
fi

if [ -f $NOAUTH ]
then
  mv $NOAUTH /etc/sqiud3/conf.d/disabled/noauth.conf
fi
ls -nrth /etc/squid3/conf.d/*
/usr/sbin/squid3 -N -d 3
