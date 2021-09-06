#!/bin/bash 
 
 #----------------------------------
# FUNCTION: $* and $@ metheod
# AUTHER: 1zoxun1@gmail.com
# DATE: 2021-09-03 13:55:16 
#-----------------------------------
 
 # "$*"和"$@"的古怪行为, 
 #+ 依赖于它们是否被""引用. 
 # 单词拆分和换行的不一致处理. 
 
 
 
 set -- "First one" "second" "third:one" "" "Fifth: :one" 
 # 设置这个脚本参数,$1,$2,等等. 

echo 

echo 'IFS unchanged, using "$*"' 
c=0 
for i in "$*" # 引用
do echo "$((c+=1)): [$i]" # 这行在下边的每个例子中都一样. 
# Echo 参数. 
done 
echo --- 

echo 'IFS unchanged, using $*' 
c=0 
for i in $* # 未引用
do echo "$((c+=1)): [$i]" 
done 
echo --- 

echo 'IFS unchanged, using "$@"' 
c=0 
for i in "$@" 
do echo "$((c+=1)): [$i]" 
done 
echo --- 

echo 'IFS unchanged, using $@' 
c=0 
for i in $@ 
do echo "$((c+=1)): [$i]" 
done 
echo --- 

IFS=: 
echo 'IFS=":", using "$*"' 
c=0 
for i in "$*" 
do echo "$((c+=1)): [$i]" 
done 
echo --- 

echo 'IFS=":", using $*' 
c=0 
for i in $* 
do echo "$((c+=1)): [$i]" 
done 
echo --- 

var=$* 
echo 'IFS=":", using "$var" (var=$*)' 
c=0 
for i in "$var" 
do echo "$((c+=1)): [$i]" 
done 
echo --- 

echo 'IFS=":", using $var (var=$*)' 
c=0 
for i in $var 
do echo "$((c+=1)): [$i]" 
done 
echo --- 

var="$*" 
echo 'IFS=":", using $var (var="$*")' 
c=0 
for i in $var 
do echo "$((c+=1)): [$i]" 
done 
echo --- 

echo 'IFS=":", using "$var" (var="$*")' 
c=0 
for i in "$var" 
do echo "$((c+=1)): [$i]" 
done 
echo --- 

echo 'IFS=":", using "$@"' 
c=0 
for i in "$@" 
do echo "$((c+=1)): [$i]" 
done 
echo --- 

echo 'IFS=":", using $@' 
c=0 
for i in $@ 
do echo "$((c+=1)): [$i]" 
done 
echo --- 

var=$@ 
echo 'IFS=":", using $var (var=$@)' 
c=0 
for i in $var 
do echo "$((c+=1)): [$i]" 
done 
echo --- 

echo 'IFS=":", using "$var" (var=$@)' 
c=0 
for i in "$var" 
do echo "$((c+=1)): [$i]" 
done 
echo --- 

var="$@" 
echo 'IFS=":", using "$var" (var="$@")' 
c=0 
for i in "$var" 
do echo "$((c+=1)): [$i]" 
done 
echo --- 



: '
output:
bash test6.sh 

IFS unchanged, using "$*"
1: [First one second third:one  Fifth: :one]
---
IFS unchanged, using $*
1: [First]
2: [one]
3: [second]
4: [third:one]
5: [Fifth:]
6: [:one]
---
IFS unchanged, using "$@"
1: [First one]
2: [second]
3: [third:one]
4: []
5: [Fifth: :one]
---
IFS unchanged, using $@
1: [First]
2: [one]
3: [second]
4: [third:one]
5: [Fifth:]
6: [:one]
---
IFS=":", using "$*"
1: [First one:second:third:one::Fifth: :one]
---
IFS=":", using $*
1: [First one]
2: [second]
3: [third]
4: [one]
5: []
6: [Fifth]
7: [ ]
8: [one]
---
IFS=":", using "$var" (var=$*)
1: [First one:second:third:one::Fifth: :one]
---
IFS=":", using $var (var=$*)
1: [First one]
2: [second]
3: [third]
4: [one]
5: []
6: [Fifth]
7: [ ]
8: [one]
---
IFS=":", using $var (var="$*")
1: [First one]
2: [second]
3: [third]
4: [one]
5: []
6: [Fifth]
7: [ ]
8: [one]
---
IFS=":", using "$var" (var="$*")
1: [First one:second:third:one::Fifth: :one]
---
IFS=":", using "$@"
1: [First one]
2: [second]
3: [third:one]
4: []
5: [Fifth: :one]
---
IFS=":", using $@
1: [First one]
2: [second]
3: [third]
4: [one]
5: []
6: [Fifth]
7: [ ]
8: [one]
---
IFS=":", using $var (var=$@)
1: [First one second third]
2: [one  Fifth]
3: [ ]
4: [one]
---
IFS=":", using "$var" (var=$@)
1: [First one second third:one  Fifth: :one]
---
IFS=":", using "$var" (var="$@")
1: [First one second third:one  Fifth: :one]
---
IFS=":", using $var (var="$@")
1: [First one second third]
2: [one  Fifth]
3: [ ]
4: [one]

'

