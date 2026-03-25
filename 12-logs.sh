#!/bin/bash

userid=$(id -u)
logsfolder="var/log/shell-script"
logsfile="var/log/shell-script/$0.log"

if [ $userid  -ne 0 ]; then

echo "please run the script with root access "
exit 1
fi
mkdir -p $logsfolder

VALIDATE () {
    if [ $1 -ne 0 ]; then
        echo "$2 is.......failure"
     else
        echo "$2 is......success"
    fi    
}

dnf install nginx -y &>>logesfolder
VALIDATE $? "installing nginx"

dnf install mysql -y &>>logesfolder
VALIDATE $? "installing mysql"

dnf install nodejs -y &>>logesfolder
VALIDATE $? "installing nodejs"