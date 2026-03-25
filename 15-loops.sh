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
    if [$1 -ne 0 ]; then
        echo "$2 is.......failure" | tee -a $logsfile
     else
        echo "$2 is......success" | tee -a $logsfile
    fi    
}

for package in $@
do
        dnf list installed $package &>> $logsfile
        if [$? -ne 0]; then
            echo "$package is not install installing now"
            dnf install $package -y &>> $logsfile
            VALIDATE $? " $package installing "
        else
            echo " $package is already installed skipping "
        fi    


done

