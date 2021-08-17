#!/bin/bash

#----------------------------------
# FUNCTION: Multi-line comment
# AUTHER: 1zoxun1@gmail.com
# DATE: 2021-08-16 03:04:55 
#-----------------------------------

 

example1() {

 SYSCODE=$1
 APP_NAME=$2
 MODE_NAME=$3
 
 echo "${SYSCODE}下的${APP_NAME}分布在${MODE_NAME}里面"

}

example1 $1 $2 $3

: '
$ sh getopts.sh a b c
output:
a下的b分布在c里面
'


func() {
    echo "Usage:"
    echo "getopts.sh [-j S_DIR] [-m D_DIR]"
    echo "Description:"
    echo "S_DIR,the path of source."
    echo "D_DIR,the path of destination."
    exit -1
}
 
#-----------------------------------

example2() {

 upload="false"
 
 while getopts 'h:j:m:u' OPT; do
    case $OPT in
        j) S_DIR="$OPTARG";;
        m) D_DIR="$OPTARG";;
        u) upload="true";;
        h) func;;
        ?) func;;
    esac
 done
 
 echo $S_DIR
 echo $D_DIR
 echo $upload

}

example2 $*

: '
$ sh getopts.sh -j /getopts -m /tmp -u
output:
/getopts
/tmp
true
'

#-----------------------------------

example3 () {

while getopts :abc: OPTION;do         
    case $OPTION in
      a)echo "get option a"
      ;;
      b)echo "get option b and parameter is $OPTARG"
      ;;
      c)echo "get option c and parameter is $OPTARG"
      ;;
      ?)echo "get a non option $OPTARG and OPTION is $OPTION"
      ;;
    esac
done

}

example3 $*

: '
$ sh getopts.sh -a haha
get option a

$ sh getopts.sh -a haha -b hehe
get option a

$ sh getopts.sh -a haha -c heihei        
get option a

$ sh getopts.sh -a haha -b hehe -c heihei
get option a

$ sh getopts.sh -a haha -c hehe -b heihei
get option a 

$ sh getopts.sh -b hehe
get option b and parameter is

$ sh getopts.sh -b haha -a hehe
get option b and parameter is

$ sh getopts.sh -b haha -c hehe
get option b and parameter is

$ sh getopts.sh -b haha -a hehe -c heihei
get option b and parameter is

$ sh getopts.sh -b haha -c hehe -a heihei
get option b and parameter is
 
$ sh getopts.sh -c haha
get option c and parameter is haha

$ sh getopts.sh -c haha -a hehe
get option c and parameter is haha
get option a

$ sh getopts.sh -c haha -b heihei
get option c and parameter is haha
get option b and parameter is

$ sh getopts.sh -c haha -a hehe -b heihei
get option c and parameter is haha
get option a

$ sh getopts.sh -c haha -b hehe -c heihei
get option c and parameter is haha
get option b and parameter is
 
$ sh getopts.sh -abc hehe
get option a
get option b and parameter is
get option c and parameter is hehe
'

#---------------end-------------------

