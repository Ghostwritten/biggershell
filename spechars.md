
##  '#'

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
