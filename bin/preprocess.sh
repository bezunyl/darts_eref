#!/bin/sh

ip=$(hostname -I | awk '{print $1}')

sed "s/IP_ADDRESS/${ip}/g" $1