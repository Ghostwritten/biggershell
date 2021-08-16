#!/bin/bash

#----------------------------------
# FUNCTION: Multi-line comment
# AUTHER: 1zoxun1@gmail.com
# DATE: 2021-08-16 03:04:55 
#-----------------------------------

comment1() {

  echo "Say Something"
<<COMMENT
    your comment 1
    comment 2
    blah
    echo "hello "
    ls
COMMENT
  echo "Do something else"

}

# 2. : + 空格 + 单引号
# 2. : + [blank] + '
: '
output:
Say Something
Do something else
'

comment1
