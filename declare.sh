#!/bin/bash

declare选项：
           -r 只读
           -i 整形


declare -i number 
# 这个脚本将把变量"number"后边的赋值视为一个整形. 
number=3 
echo "Number = $number" # Number = 3 #

number=three 
echo "Number = $number" # Number = 0 

#如果把一个变量指定为整形,那么即使没有 expr 和 let 命令,也允许使用特定的算术运算
n=6/3 
echo "n = $n" # n = 6/3 

declare -i n 
n=6/3 
echo "n = $n" # n = 2
