#!/bin/bash

set -e

trap 'echo "there is an error in $LINENO, command:$BASH_COMMAND " ' ERR

echo " hellow world "
echo " i am learning shell "
echoo " printing error here "
echo " no error in this "