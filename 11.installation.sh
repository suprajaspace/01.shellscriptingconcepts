#!/bin/bash

# to check root access line 4-10 ,  # id=0 means root access.  id -u prints root access number
USERID=$(id -u)
#echo "user ID is: $USERID"
if [ $USERID -ne 0 ]
then
    echo "Please run this script with root priveleges"
    exit 1
fi
    
# to install git, here first if condition for to check git installed or not. second if i.e nested if to check if not installed git proceed to install git.
dnf list installed git
if [ $? -ne 0 ]
then
    echo "git is not installed,going to install it"
    dnf install git -y
    if [ $? -ne 0 ]
    then
        echo "git installation is not successful --check it"
    fi
    else
        echo "git is already installed, nothing to do.."

fi

# to install mysql, here first if condition for to check mysql installed or not. second if i.e nested if to check if not installed mysql proceed to install git.
dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "mysql is not installed,going to install it"
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "mysql installation is not successful --check it"
    fi
    else
        echo "mysql is already installed, nothing to do.."
fi