#!/bin/bash

FREE=`free -m | grep "buffers/cache" | awk '{print $3}'`
SWAP=`free -m | grep "Swap" | awk '{print $3}'`
UP=`uptime`

echo $FREE
echo $SWAP
echo $UP
echo -e "\e[1;33;44m[ ARBURA | 0838-513-99-153 | 745D1F66 ]\e[0m"
echo "thanks to YurisshOS"

