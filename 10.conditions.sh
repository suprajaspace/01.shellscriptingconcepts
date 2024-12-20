#!/bin/bash
NUMBER=$1

if [ $NUMBER -gt 20 ] #gt, lt, eq,-ne,-ge,-le
then
echo "Given number $NUMBER is greater than 20"
else
echo "Given number $NUMBER is less than 20"
fi



if [ $NUMBER -ge 20 ] #gt, lt, eq,-ne,-ge,-le
then
echo "Given number $NUMBER is greater than 20"
else
echo "Given number $NUMBER is less than 20"
fi


if [ $NUMBER -eq 20 ] #gt, lt, eq,-ne,-ge,-le
then
echo "Given number $NUMBER is equal to 20"
else
echo "Given number $NUMBER is not equal 20"
fi