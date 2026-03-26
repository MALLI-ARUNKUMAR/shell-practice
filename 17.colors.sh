#!/bin/bash

userid=$(id -u)
logsfolder="/var/log/shell-script"
logsfile="/var/log/shell-script/$0.log"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

if [ $userid  -ne 0 ]; then

echo -e" $R please run the script with root access $N " | tee -a $logsfile
exit 1
fi
mkdir -p $logsfolder

VALIDATE () {
    if [ $1 -ne 0 ]; then
        echo -e "$2 is.......$R failure $N" | tee -a $logsfile
     else
        echo -e "$2 is......$G success $N " | tee -a $logsfile
    fi    
}

for package in $@
do
        dnf list installed $package &>> $logsfile
        if [ $? -ne 0 ]; then
            echo "$package is not installed installing now"
            dnf install $package -y &>> $logsfile
            VALIDATE $? " $package installing "
        else
            echo " $package is already installed skipping "
        fi    


done

