#!/bin/bash

#----------------------------------
# FUNCTION: Multi-line comment
# AUTHER: 1zoxun1@gmail.com
# DATE: 2021-08-16 03:04:55 
#-----------------------------------

: '
$ IFS=''
$ set foo bar bam
$ echo "$@"
foo bar bam
$ echo "$*"
foobarbam
$ unset IFS
$ echo "$*"
foo bar bam


$ IFS=a
$ echo "$@"
foo bar bam
$ echo "$*"
fooabarabam
$ unset IFS
$ echo "$*"
foo bar bam

'
#-----------------------------------

example1() {

 IFS='|'
 text='a a a a|b b b b|c c c c'
 for i in $text;do echo "i=$i";done

}

example1

: '
$ sh IFS.sh
output:
i=a a a a
i=b b b b
i=c c c c
'

#-----------------------------------

example2 () {

conf="ABC
A B C
1|2|3
1 2 3"
echo "$conf"

echo --------------

for c in $conf 
do
    echo "line='$c'";
done
 
echo --------------

IFS=$'\n'
for c in $conf
do
 echo "line='$c'";
done

}

example2

: '
$ sh IFS.sh
output:
ABC
A B C
1|2|3
1 2 3
--------------
line='ABC'
line='A'
line='B'
line='C'
line='1|2|3'
line='1'
line='2'
line='3'
--------------
line='ABC'
line='A B C'
line='1|2|3'
line='1 2 3'
'
#----------------end------------------
