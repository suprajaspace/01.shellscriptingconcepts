#!/bin/bash

echo "practice"
NUMBER1=$1
NUMBER2=$2
SUM=$(($NUMBER1+$NUMBER2))
echo "$SUM"

USERID=$(id -u)

echo "$USERID"

R="\e[31m"
N="\e[0m"

echo -e "$R supraja $N"

if [ $3 -ge 20 ]
then 
echo " arguments passed"
else
echo "arguments not passed"
fi

echo " $# arguments passed "

for print
do 
    echo "$@"
done

for print
do 
    echo "$#"
done
for print
do 
    echo "$0"
done