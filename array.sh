#!/bin/bash

#读取数组
example1() {

my_array=(A B "C" D)

  echo "第一个元素为: ${my_array[0]}"
  echo "第二个元素为: ${my_array[1]}"
  echo "第三个元素为: ${my_array[2]}"
  echo "第四个元素为: ${my_array[3]}"
  echo "默认元素：$my_array"
  #output
  #第一个元素为: A
  #第二个元素为: B
  #第三个元素为: C
  #第四个元素为: D
}

example1


#获取数组中的所有元素
example2() {

 my_array[0]=A
 my_array[1]=B
 my_array[2]=C
 my_array[3]=D

 echo "数组的元素为: ${my_array[*]}"
 echo "数组的元素为: ${my_array[@]}"

#output:
#数组的元素为: A B C D
#数组的元素为: A B C D


}



example2

#获取数组的长度
example3() {

my_array[0]=A
my_array[1]=B
my_array[2]=C
my_array[3]=D

echo "数组元素个数为: ${#my_array[*]}"
echo "数组元素个数为: ${#my_array[@]}"

#output:
#数组元素个数为: 4
#数组元素个数为: 4

}

example3
