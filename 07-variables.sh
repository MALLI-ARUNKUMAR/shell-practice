#!/bin/bash

## special variables ##

echo " all args passed to the script : $@"
echo "number of variables passed to the script :$#"
echo "script name : $0"
echo "present directory :$pwd"
echo "who is running : $user"
echo "home directory of current user :$home"
echo "PID of the script :$$"
sleep 100 &
echo "PID of recently executed background process :&!"