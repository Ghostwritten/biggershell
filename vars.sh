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

: '
output:
dir1/dir2/dir3/my.file.txt
my.file.txt
file.txt
txt
/dir1/dir2/dir3

/dir1/dir2/dir3/my.file
/dir1/dir2/dir3/my
/path1/dir2/dir3/my.file.txt
/path1/path2/path3/my.file.txt
/dir1/dir2/dir3/my.file.txt
/dir1/dir2/dir3/my.file.txt
my.file.txt
my.file.txt
/dir1/dir2/dir3/my.file.txt
/dir1/dir2/dir3/my.file.txt
/dir1/dir2/dir3/my.file.txt
/dir1/dir2/dir3/my.file.txt
27
'

----------------------------------



