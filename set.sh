#!/bin/bash


#----------------------------------
# FUNCTION: set methods
# AUTHER: 1zoxun1@gmail.com
# DATE: 2021-08-16 03:04:55 
#-----------------------------------


# 'set' All environment variables and Shell functions are displayed
# 'set' 显示所有的环境变量和 Shell 函数
example1() {

 set 
 a=1
 b=2
 c=3
 echo $a
 echo $b
 echo $c
 echo $d

}

example1

: '
output:
............
UID=0
USER=root
XDG_DATA_DIRS=/usr/local/share:/usr/share:/var/lib/snapd/desktop
XDG_RUNTIME_DIR=/run/user/0
XDG_SESSION_ID=105
_=/bin/bash
example1 () 
{ 
    set;
    a=1;
    b=2;
    c=3;
    echo $a;
    echo $b;
    echo $c;
    echo $d
}
1
2
3

'
#----------------------------------------

# 'set -u' or 'set -o nounset' If a variable does not exist, an error is reported and execution is stopped
# 'set -u' 或者 'set -o nounset' 遇到不存在的变量就会报错，并停止执行
example2() {

 set -u #-o nounset
 a=1
 b=2
 c=3
 echo $a
 echo $b
 echo $d
 echo $c

}

example2

: '
output:
1
2
set.sh: line 65: d: unbound variable
'

#----------------------------------------

# 'set -x' or 'set -o xtrace' 用来在运行结果之前，先输出执行的那一行命令,即解析指令
# 'set -x' or 'set -o xtrace' It is used to print the line of command that was executed before the result is run, that is, the parse instruction
example3() {

 set -x #set -o xtrace
 a=1
 b=2
 c=3
 echo $a
 echo $b
 echo $c
 echo $d

}

example3

: '
output:
+ a=1
+ b=2
+ c=3
+ echo 1
1
+ echo 2
2
+ echo 3
3
+ echo

' 

#----------------------------------------


# 'set -e' ot 'set -o errexit' The script terminates execution whenever an error occurs
# 'set -e' ot 'set -o errexit' 脚本只要发生错误，就终止执行 
example4() {

 set -e

 foo
 echo bar

}

example4

: '
output:
set.sh: line 117: foo: command not found
'

#----------------------------------------

# 'set +e' 执行失败脚本不会终止执行
# 'set -e' Failing to execute the script does not terminate execution
example5 () {
 
 set +e 
 foo
 echo foo
 set -e
 bar
 echo bar
 
}

example5
 
: '
output:
set.sh: line 134: foo: command not found
foo
set.sh: line 137: bar: command not found
'

#----------------------------------------

# 'set -e' and 'command || true' 执行失败脚本不会终止执行
# 'set -e' and 'command || true' Failing to execute the script does not terminate execution
example6() {

 set -e

 foo || true
 echo bar

}

example6

: '
output:
set.sh: line 157: foo: command not found
bar
'

#----------------------------------------

# 'set -e' and '|' 执行失败脚本不会终止执行,与'||'类似
# 'set -e' and '|' Failing to execute the script does not terminate execution, Similar to '||'
example7() {

 set -e

 foo | echo a
 echo bar

}

example7

: '
output:
a
set.sh: line 176: foo: command not found
bar
'

#----------------------------------------

# 所谓管道命令，就是多个子命令通过管道运算符（|）组合成为一个大的命令。Bash 会把最后一个子命令的返回值，作为整个命令的返回值。也就是说，只要最后一个子命令不失败，管道命令总是会执行成功，因此它后面命令依然会执行，set -e就失效了。
# Alleged piping, it is more child command through the pipeline operator (|) combination become a big order.Bash takes the return value of the last subcommand as the return value of the entire command.That is, as long as the last subcommand does not fail, the pipe command always executes successfully, so it follows the command,It will still execute, set -e will fail

# 'set -o pipefail' and '|' 只要一个子命令失败，整个管道命令就失败，脚本就会终止执行
# 'set -o pipefail' and '|' If one subcommand fails, the entire pipe command fails, and the script terminates execution
example8() {

 set -eo pipefail

 foo | echo a
 echo bar

}

example8

: '
output:
a
set.sh: line 199: foo: command not found
'
#-------------------end---------------------
