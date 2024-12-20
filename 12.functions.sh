#!/bin/bash

USERID=$(id -u)
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
        echo " $2 is --FAILED"
        exit1
        else
        echo "$2 is --Success"
    fi
}

CHECK_ROOT
    
dnf list installed git
if [ $? -ne 0 ]
then
    echo "git is not installed,going to install it"
    dnf install git -y
   VALIDATE $? "Installing git"   
    else
        echo "git is already installed, nothing to do.."

fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "mysql is not installed,going to install it"
    dnf install mysql -y
    VALIDATe $? "Installing mysql" 
    else
        echo "mysql is already installed, nothing to do.."
fi