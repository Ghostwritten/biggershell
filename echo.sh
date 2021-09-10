#!/bin/bash

#----------------------------------
# FUNCTION: echo method
# AUTHER: 1zoxun1@gmail.com
# DATE: 2021-08-16 03:04:55 
#-----------------------------------



echo Hello
echo

a=hello
echo $a

#字符大小转换
a=`echo "HELLO" | tr A-Z a-z` 
echo $a

#不换行
echo -n $a
echo $a

b=world
echo -n $a  $b

echo "---------------"

#换行
echo "Why doesn't this string \n split on two lines?"

echo $"A line of text containing 
a linefeed."

echo "---------------"

echo "This string splits 
 on two lines."
