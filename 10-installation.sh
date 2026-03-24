#!/bin/bash

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ];then

echo "plese run the script with the root user access "

fi
echo "installing nginx"
dnf install nginx-y