
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
 空命令,等价于"NOP"(no op,一个什么也不干的命令).也可以被认为与 shell 的内建命令(true)作用相同.":"命令是一个 bash 的内建命令,它的返回值为 0,就是 shell 返回的 true. 
```
bash$ cat test.sh 
:
echo $?
bash$ bash test.sh 
0
```
死循环
```
while : 
do 
operation-1 
operation-2 
... 
operation-n 
done 
```


 
