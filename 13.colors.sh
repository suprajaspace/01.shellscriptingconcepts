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
    VALIDATE $? "Installing mysql" 
    else
        echo "mysql is already installed, nothing to do.."
fi