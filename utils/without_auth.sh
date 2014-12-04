#!/bin/bash
AUTH=/etc/squid3/conf.d/enabled/auth.conf
NOAUTH=/etc/squid3/conf.d/disabled/noauth.conf
if [ -f $AUTH ]
then
  echo "Disable auth"
  mv $AUTH /etc/squid3/conf.d/disabled/
fi

if [ -f $NOAUTH ]
then
  mv $NOAUTH /etc/squid3/conf.d/enabled/
fi
ls -nrth /etc/squid3/conf.d/*
/usr/sbin/squid3 -N -d 3
