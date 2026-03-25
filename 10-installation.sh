#!/bin/bash

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ];then

echo "plese run the script with the root user access "

fi
echo "installing nginx"
dnf install nginx -y

if [ $? -ne 0 ]; then

echo "installing nginx is....failure"
exit 1
else
echo "installing nginx is....success"
fi

dnf install mysql -y
if [ $? -ne 0 ]; then

echo "installing nginx is....failure"
exit 1
else
echo "installing nginx is....success"
fi
dnf install nodejs -y
if [ $? -ne 0 ]; then

echo "installing nginx is....failure"
exit 1
else
echo "installing nginx is....success"
fi
