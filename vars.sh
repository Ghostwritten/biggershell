#!/bin/bash


#----------------------------------
# FUNCTION: vars metheod
# AUTHER: 1zoxun1@gmail.com
# DATE: 2021-09-03 13:55:16 
#-----------------------------------


file=/dir1/dir2/dir3/my.file.txt
echo ${file#*/}
echo ${file##*/} 
echo ${file#*.}
echo ${file##*.}

echo ${file%/*}
echo ${file%%/*}
echo ${file%.*}
echo ${file%%.*}
echo ${file/dir/path}
echo ${file//dir/path}
echo ${file-my.file.txt}
echo ${file:-my.file.txt}
echo ${file+my.file.txt} 
echo ${file:+my.file.txt} 
echo ${file=my.file.txt}
echo ${file:=my.file.txt}
echo ${file?my.file.txt} 
echo ${file:?my.file.txt} 
echo ${#file} 
