# biggershell
Shell 是一个用 C 语言编写的程序，它是用户使用 Linux 的桥梁。Shell 既是一种命令语言，又是一种程序设计语言。

## 什么时候不用shell
- 资源密集型的任务,尤其在需要考虑效率时(比如,排序,hash 等等)
- 需要处理大任务的数学操作,尤其是浮点运算,精确运算,或者复杂的算术运算(这种情况一般使用 C++或 FORTRAN 来处理)
- 有跨平台移植需求(一般使用 C 或 Java)
- 复杂的应用,在必须使用结构化编程的时候(需要变量的类型检查,函数原型,等等) 
- 对于影响系统全局性的关键任务应用。
- 对于安全有很高要求的任务,比如你需要一个健壮的系统来防止入侵,破解,恶意破坏等等.
- 项目由连串的依赖的各个部分组成。
- 需要大规模的文件操作
- 需要多维数组的支持
- 需要数据结构的支持,比如链表或数等数据结构
- 需要产生或操作图形化界面 GUI 
- 需要直接操作系统硬件
- 需要 I/O 或 socket 接口
- 需要使用库或者遗留下来的老代码的接口
- 私人的,闭源的应用(shell 脚本把代码就放在文本文件中,全世界都能看到) 
