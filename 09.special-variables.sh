#!/bin/bash
echo "All variables passed to the script: $@"     # to know what variables passed to the script
echo "Number of variables passed : $#"            # to know how many variables passed to the script
echo "Script name: $0"                        # to know name of the script
echo "current working directory : $PWD"       # to now current working directory
echo "Home directory of the user : $HOME"     # to know home directory
echo "PID of the script executing now :$$"    # to know Process ID of the running script ( it will close after script executed)
sleep 100 &
echo "PID of the last background command:$!"  # to know the PID of last command , sleep PID will process till 100s seconds , so can see sleep PID 

echo "exit status:$?"  # to now state of preious command 0 --> success. 1-127 --> Failure