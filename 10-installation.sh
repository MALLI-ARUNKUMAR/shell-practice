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

echo "installing mysql"
dnf install mysql -y
if [ $? -ne 0 ]; then

echo "installing mysql is....failure"
exit 1
else
echo "installing mysql is....success"
fi

echo "installing nodejs"
dnf install nodejs -y
if [ $? -ne 0 ]; then

echo "installing nodejs is....failure"
exit 1
else
echo "installing nodejs is....success"
fi
