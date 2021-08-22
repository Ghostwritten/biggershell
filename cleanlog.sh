#!/bin/bash


#----------------------------------
# FUNCTION: clean log 
# AUTHER: 1zoxun1@gmail.com
# DATE: 2021-08-22 13:55:16 
#-----------------------------------

# Warning:
# good scripts


LOG_DIR=/var/log
ROOT_UID=0 # $UID 为 0 的时候,用户才具有根用户的权限
LINES=50 # 默认的保存行数
E_XCD=66 # 不能修改目录? 
E_NOTROOT=67 # 非根用户将以 error 退出

if [ "$UID" -ne "$ROOT_UID" ]
then
   echo "Must be root to run this script."
   exit $E_NOTROOT 
fi


if [ -n "$1" ]
then
   lines=$1
else
   lines=$LINES
fi

E_WRONGARGS=65 

case "$1" in 
        "" ) lines=50;; 
        *[!0-9]*) echo "Usage: `basename $0` file-to-cleanup"; exit $E_WRONGARGS;; 
        * ) lines=$1;; 
esac

cd $LOG_DIR  || { 
   echo "Cannot change to necessary directory." >&2
   exit $E_XCD; 
}

tail -$lines messages > mesg.temp
mv mesg.temp messages 
cat /dev/null > wtmp
echo "Logs cleaned up." 

exit 0 


#-------------- end ---------------
: '
$ bash cleanlog.sh sgs
output:
Usage: cleanlog.sh file-to-cleanup
$ echo $?
65

$  cat /var/log/messages | wc -l
2584
$  bash cleanlog.sh 
Logs cleaned up.
$ cat /var/log/messages | wc -l
50
$ bash cleanlog.sh 25
Logs cleaned up.
$ cat /var/log/messages | wc -l
25

$ mv /var/log /var/logs
$ bash cleanlog.sh 
cleanlog.sh: line 37: cd: /var/log: No such file or directory
Cannot change to necessary directory.
$ echo $?
66

'
