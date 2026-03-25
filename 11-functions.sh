#!/bin/bash

USER_ID=$(id -u)

if [ USER_ID -ne 0 ]; then

echo "please run the script with root access "
exit 1
fi

VALIDATE () {
    if [$1 -ne 0]
        echo "$2 is.......failure"
    else
        echo "$2 is......success"
    fi    
}

dnf install nginx -y
VALIDATE $? "installing nginx"

dnf install mysql -y
VALIDATE $? "installing mysql"

dnf install nodejs -
VALIDATE $? "installing nodejs"