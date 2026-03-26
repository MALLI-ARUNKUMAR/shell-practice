#!/bin/bash

set -e

trap 'echo "there is an error in $LINENO, command:$BASH_COMMAND " ' ERR

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


for package in $@
do
        dnf list installed $package &>> $logsfile
        if [ $? -ne 0 ]; then
            echo "$package is not installed installing now"
            dnf install $package -y &>> $logsfile
            
        else
           echo -e " $Y $package is already installed skipping $N"
        fi    


done

