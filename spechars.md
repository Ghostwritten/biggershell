
# 特殊字符

##  `#`

注释
```
echo "The # here does not begin a comment." 
echo 'The # here does not begin a comment.' 
echo The \# here does not begin a comment. 
echo The # 这里开始一个注释

echo ${PATH#*:} # 参数替换,不是一个注释
echo $(( 2#101011 )) # 数制转换,不是一个注释

output:

The # here does not begin a comment.
The # here does not begin a comment.
The # here does not begin a comment.
The
/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
43
```

## `;`
命令分隔符,可以用来在一行中来写多个命令
```
echo hello; echo there 

output:
hello
there
```

## `;;`
终止"case"选项

```
$ cat case.sh 

variable=$1

case "$variable" in 
      abc) echo "\$variable = abc" ;; 
      xyz) echo "\$variable = xyz" ;; 
esac

output: 

$ bash case.sh abc
$variable = abc
$ bash case.sh xyz
$variable = xyz
```

## `.`
- `.`命令等价于 source 命令
```
bash$cat test1.sh 
echo "`basename $0`: hello world"
bash$ cat test2.sh 
. test1.sh
bash$ bash test2.sh 
test2.sh: hello world
```
- `.`作为文件名的一部分.如果作为文件名的前缀的话,那么这个文件将成为隐藏文件. 
```
bash$ touch .hidden-file 
bash$ ls -l 
bash$ ls -al
-rw-rw-r-- 1 bozo bozo 0 Aug 29 20:54 .hidden-file
```
- `.`命令如果作为目录名的一部分的话,那么.表达的是当前目录.".."表示上一级目录. 
```
 bash$ pwd 
 /home/bozo/projects 
 bash$ cd .. 
 bash$ pwd 
 /home/bozo/
 ```
- `.`命令经常作为一个文件移动命令的目的地.
 ```
 bash$ cp /home/bozo/current_work/junk/* .
 ```
- .字符匹配,这是作为正则表达是的一部分,用来匹配任何的单个字符.
 
 ## `"`
 部分引用."STRING"阻止了一部分特殊字符
 
 ## `'`
 全引用. 'STRING' 阻止了全部特殊字符
 
 ## `,`
 逗号链接了一系列的算术操作,虽然里边所有的内容都被运行了,但只有最后一项被返回.例如：let "t2 = ((a = 9, 15 / 3))" # Set "a = 9" and "t2 = 15 / 3"
 
 ## `\`
 转义字符,如\X 等价于"X"或'X'
 
 ## `/`
 文件名路径分隔符.或用来做除法操作. 
 
 ## ``` ` ```
 后置引用,命令替换
 ```
bash$ echo `hostname`
test1
bash$ echo hostname
hostname
```
 
 ## `:`
 - 空命令,等价于"NOP"(no op,一个什么也不干的命令).也可以被认为与 shell 的内建命令(true)作用相同.":"命令是一个 bash 的内建命令,它的返回值为 0,就是 shell 返回的 true. 
```
bash$ cat test.sh 
:
echo $?
bash$ bash test.sh 
0
```
- 死循环
```
while : 
do 
operation-1 
operation-2 
... 
operation-n 
done 
```
与下面相同：
```
while true
do
....
done
```
- 在 if/then 中的占位符
```
if condition
then:  # 什么都不做,引出分支.
else
   take-some-action
fi
```
- 在一个 2 元命令中提供一个占位符
```
bash$  cat test.sh 
: ${username=`whoami`}
echo $username
bash$ root@test1:~/shell# bash test.sh 
root
```

- 在和 > (重定向操作符)结合使用时,把一个文件截断到 0 长度,没有修改它的权限. 如果文件在之前并不存在,那么就创建它.
```
: > data.xxx       ##与 cat /dev/null >data.xxx 的作用相同,然而,这不会产生一个新的进程,因为":"是一个内建命令
```

- ":"还用来在/etc/passwd 和$PATH 变量中用来做分隔符
```
bash$ echo $PATH 
 /usr/local/bin:/bin:/usr/X11R6/bin:/sbin:/usr/sbin:/usr/games
```
## `!`
取反操作符,将反转"退出状态"结果

## `*`

- 万能匹配字符,用于文件名匹配(这个东西有个专有名词叫 file globbing),或者是正则表达式中.注意:在正则表达式匹配中的作用和在文件名匹配中的作用是不同的. 

```
bash$ echo * 
abs-book.sgml add-drive.sh agram.sh alias.sh 
```

- 数学乘法
- **是幂运算

## `?`

测试操作.在一个确定的表达式中,用?来测试结果,`(())`结构可以用来做数学计算或者是写 c 代码,那?就是 c 语言的 3 元操作符的一个. 在"参数替换"中,?测试一个变量是否被 set 了.

## `$`
- 变量替换,`${}`同理
```
var1=5
var2=23skidoo 
echo $var1  # 5
echo $var2 # 23skidoo
```
- 在正则表达式中作为行结束符

- $*,$@ ,位置参数
- $? 退出状态变量.$?保存一个命令/一个函数或者脚本本身的退出状态. 
- $$ 进程 ID 变量.这个$$变量保存运行脚本进程 ID

## `()`
- 命令组
```
 (a=hello;echo $a) 
```
注意:在()中的命令列表,将作为一个子 shell 来运行.在()中的变量,由于是在子 shell 中,所以对于脚本剩下的部分是不可用的. 
```
a=123 
( a=321; ) 
echo "a = $a" # a = 123     
# 在圆括号中 a 变量,更像是一个局部变量. 
```
- 用在数组初始化
```
Array=(element1,element2,element3)
```
## `(())`
数学计算的扩展

## `{}`
- 大括号扩展
```
# 把 file1,file2,file3 连接在一起,并且重定向到 combined_file 中
bash$ cat {file1,file2,file3} > combined_file 

# 拷贝"file22.txt" 到"file22.backup"
bash$ cp file22.{txt,backup} 

bash$ echo {file1,file2}.{A,"B",'C'}
file1.A file1.B file1.C file2.A file2.B file2.C
bash$ echo {file1,file2}:{A,"B",'C'}
file1:A file1:B file1:C file2:A file2:B file2:C
```
注意: 在大括号中,不允许有空白,除非这个空白是有意义的.

- 代码块.又被称为内部组.事实上,这个结构创建了一个匿名的函数.但是与函数不同的是,在其中声明的变量,对于脚本其他部分的代码来说还是可见的
```
bash$ 
 { 
 local a; 
 a= 123; 
 }
```
bash 中的 local 申请的变量只能够用在函数中.
```
a=123 
{ a=321; }
echo "a = $a" # a = 321 
#(说明在代码块中对变量 a 所作的修改,影响了外边的变
量 a) 
```

##  `{} \;` 
路径名.一般都在 find 命令中使用.这不是一个 shell 内建命令.
注意: ";"用来结束 find 命令序列的-exec 选项.

## `[]`

- test 的表达式将在[]中. 值得注意的是`[`是 shell 内建 test 命令的一部分,并不是/usr/bin/test 中的扩展命令的一个连接.
- 数组元素
```
Array[1]=slot_1
echo ${Array[1]}  #slot_1
```
- 字符范围,在正则表达式中使用,作为字符匹配的一个范围

## `[[]]`
test 表达式放在[[]]中

## `>&>>&>><`

重定向.
- scriptname >filename 重定向脚本的输出到文件中.覆盖文件原有内容
- command &>filename 重定向 stdout 和 stderr 到文件中
- command >&2 重定向 command 的 stdout 到 stderr
- scriptname >>filename 重定向脚本的输出到文件中.添加到文件尾端,如果没有文件, 则创建这个文件.
- <和> 可用来做字符串比较
- <和> 可用在数学计算比较
- \<,\> 正则表达式中的单词边界
```
bash$grep '\<the\>' textfile 
```

# `|`
管道.分析前边命令的输出,并将输出作为后边命令的输入.这是一种产生命令链的好方法. 

```
echo ls -l | sh
cat *.lst | sort | uniq
```
管道是进程间通讯的一个典型办法,将一个进程的 stdout 放到另一个进程的 stdin 中. 标准的方法是将一个一般命令的输出,比如 cat 或 echo,传递到一个过滤命令中(在这个过滤命令中将处理输入),得到结果,如: 
```
cat $filename1 | $filename2 | grep $search_word
```
当然输出的命令也可以传递到脚本中.如:
```
bash$ cat uppercase.sh 
#!/bin/bash 
# uppercase.sh : 修改输出,全部转换为大写 
tr 'a-z' 'A-Z' 
# 字符范围必须被""引用起来
#+ 来阻止产生单字符的文件名.
exit 0

bash$ ls -l | ./uppercase.sh
-RW-R--R-- 1 ROOT ROOT  185 JUL 20 07:16 BREAK1.SH
-RW-R--R-- 1 ROOT ROOT  118 AUG 22 14:33 CASE.SH
-RW-R--R-- 1 ROOT ROOT 1395 AUG 22 13:57 CLEANLOG.SH
```
