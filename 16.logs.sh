#!/bin/bash


LOGS_FOLDER="/var/log/shell-script"                    #LOGS_FOLDER creating to store logs
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)                # SCRIPT_NAME is deriving to use script name for to create LOG_FILE, generally for best practice LOG_FILE names should be maintain with script name 
TIMESTAMP=$(date +%y-%m-%d-%H-%M-%s)                   # TIMESTAMP is deriving to print timestamp in logs. 
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"    # LOG_FILE is to store logs for specific script name
mkdir -p $LOGS_FOLDER                                  # make directory for LOGS_FOLDER , here -p helps to make directory if it is not created, and directory already created no error throws

USERID=$(id -u)                                         # to check root user id, root user id =0 , id -u helps to give user id in number
                                                      
R="\e[31m"                                             # colors command
G="\e[32m"
N="\e[0m"
Y="\e[33m"

CHECK_ROOT(){                                          # CHECK_ROOT function created to inform root user access or not, if not root user error throw to run script with root user
    if [ $USERID -ne 0 ]
    then 
        echo -e "$R please run this script with root priveleges $N" | tee -a $LOG_FILE
        exit 1
    fi  
}
 # VALIDATE function is created to check package installation success or failed
VALIDATE(){                                        
    if [ $1 -ne 0 ]
    then
            echo -e " $2 is ---$R FAILED $N" | tee -a $LOG_FILE
            exit 1
    else 
            echo -e " $2 is ---$G SUCCESS $N" | tee -a $LOG_FILE
    fi
}
USAGE(){
    echo -e "$R USAGE :: $N sudo sh 16.redirectors.sh package1 package2.."
    exit 1
}
echo "script started executing at : $(date)" | tee -a $LOG_FILE
CHECK_ROOT
if [ $# -eq 0 ]
then 
    USAGE
fi

for package in $@  #$@ refers to all arguments passed to it
do 
    dnf list installed $package &>>$LOG_FILE
    if [ $? -eq 0 ]
    then
        echo -e "$package is already $Y installed .. nothing to do $N" | tee -a $LOG_FILE
        else 
        echo "$package is not installed, going to install it.." | tee -a $LOG_FILE
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "installing $package"
       
    fi
done
