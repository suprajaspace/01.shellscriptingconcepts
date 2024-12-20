#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK_ROOT(){
#echo "user ID is: $USERID"
if [ $USERID -ne 0 ]
then
    echo "Please run this script with root priveleges"
    exit 1
fi
}
VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e " $2 is $R --FAILED  $N"
        exit1
        else
        echo -e "$2 is $G --Success $N"
    fi
}

CHECK_ROOT
    
# for package in $@
# do 
#     echo $package
# done 

for package in $@
do 
dnf list installed $package
if [ $? -ne 0 ]
then
    echo "$package is not installed,going to install it"
    dnf install $package -y
    VALIDATE $? "Installing $package" 
    else
        echo "$package is already installed, nothing to do.."
fi
done