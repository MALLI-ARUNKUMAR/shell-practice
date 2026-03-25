#!/bin/bash

userid=$(id -u)
logsfolder="/var/log/shell-script"
logsfile="/var/log/shell-script/$0.log"

if [ $userid  -ne 0 ]; then

echo "please run the script with root access " | tee -a $logsfile
exit 1
fi
mkdir -p $logsfolder

VALIDATE () {
    if [ $1 -ne 0 ]; then
        echo "$2 is.......failure" | tee -a $logsfile
     else
        echo "$2 is......success" | tee -a $logsfile
    fi    
}

dnf install nginx -y &>> $logsfile
VALIDATE $? "installing nginx"

dnf install mysql -y &>> $logsfile
VALIDATE $? "installing mysql"

dnf install nodejs -y &>> $logsfile
VALIDATE $? "installing nodejs"