#!/bin/bash

#----------------------------------
# FUNCTION: printf method
# AUTHER: 1zoxun1@gmail.com
# DATE: 2021-08-16 03:04:55 
#-----------------------------------

printf "Hello, Shell\n"


#%s %c %d %f都是格式替代符
#%-10s 指一个宽度为10个字符（-表示左对齐，没有则表示右对齐）
#%-4.2f 指格式化为小数，其中.2指保留2位小数
printf "%-10s %-8s %-4s\n" 姓名 性别 体重kg  
printf "%-10s %-8s %-4.2f\n" 郭靖 男 66.1234 
printf "%-10s %-8s %-4.2f\n" 杨过 男 48.6543 
printf "%-10s %-8s %-4.2f\n" 郭芙 女 47.9876


# format-string为双引号
printf "%d %s\n" 1 "abc"
 
# 单引号与双引号效果一样 
printf '%d %s\n' 1 "abc" 
 
# 没有引号也可以输出
printf %s abcdef
 
# 格式只指定了一个参数，但多出的参数仍然会按照该格式输出，format-string 被重用
printf %s abc def
 
printf "%s\n" abc def
 
printf "%s %s %s\n" a b c d e f g h i j
 
# 如果没有 arguments，那么 %s 用NULL代替，%d 用 0 代替
printf "%s and %d \n"


#---------end------------
