#!/bin/bash 

#----------------------------------
# FUNCTION: shift metheod
# AUTHER: 1zoxun1@gmail.com
# DATE: 2021-09-03 13:55:16 
#-----------------------------------

echo "$@" # 1 2 3 4 5 
shift 
echo "$@" # 2 3 4 5 
shift 
echo "$@" # 3 4 5 


: '
output:
bash~: bash shift1.sh 1 2 3 4 5
1 2 3 4 5
2 3 4 5
3 4 5
'
