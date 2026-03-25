#!/bin/bash

userid=$(id -u)

if [ userid -ne 0 ]; then

echo "please run the script with root access "
exit 1
fi

VALIDATE () {
    if [ $1 -ne 0 ]; then
        echo "$2 is.......failure"
     else
        echo "$2 is......success"
    fi    
}

dnf install nginx -y
VALIDATE $? "installing nginx"

dnf install mysql -y
VALIDATE $? "installing mysql"

dnf install nodejs -y
VALIDATE $? "installing nodejs"