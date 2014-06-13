#!/bin/bash
# Script to add a user to Linux system
# -------------------------------------------------------------------------
# Copyright (c) 2007 nixCraft project <http://bash.cyberciti.biz/>
# This script is licensed under GNU GPL version 2.0 or above
# Comment/suggestion: <vivek at nixCraft DOT com>
# -------------------------------------------------------------------------
# See url for more info:
# http://www.cyberciti.biz/tips/howto-write-shell-script-to-add-user.html
# -------------------------------------------------------------------------
if [ $(id -u) -eq 0 ]; then
    read -p "Enter username : " username
    read -p "Enter password : " password
    read -p "Enter realname : " realname
    egrep "^$username" /etc/passwd >/dev/null
    if [ $? -eq 0 ]; then
        echo "$username exists!"
        exit 1
    else
        pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
        useradd -M -s /bin/false -g users -G users -c $realname -p $pass $username
        usermod $username -e `date -d "30 days" +"%Y-%m-%d"`
        [ $? -eq 0 ] && echo "User has been added to system!" || echo "Failed to add a user!"
    fi
    echo -e "\e[1;33;44m[ ARBURA | 0838-513-99-153 | 745D1F66 ]\e[0m"
else
    echo "Only root may add a user to the system"
    exit 2
fi
