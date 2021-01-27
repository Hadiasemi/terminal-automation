#!/bin/bash
read -p "Python file name: " c
read -p "Professor file name: " dir

for testInput in in*
do 
    name=${testInput%in*};
    echo $testInput;

   # read -p "Python file name:"c
    python3 $c.py<$testInput>$name.expect
    #read -p "Porfessor file name:" dir
   	  ./$dir<$testInput>$name.out
    diff  $name.out  $name.expect 
done
