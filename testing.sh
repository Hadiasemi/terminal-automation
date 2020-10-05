#!/bin/bash

input="test"
output="myOut"

o=".output"
# Professors

# Courtesy Message Params
msg="Diff Testing with Test "
stdout_diff="STDOUT DIFF"
fileio_diff="FILEIO DIFF"
long_tailz=" ---------------------------------------- "
tailz=" --- "

fileext=".asm"

make

for i in `seq $1 $2`;
do


  echo ""
  echo $msg$i$long_tailz
  echo ""

  java lab2 $input$i$fileext > $output$i

  printf "\n%s %s %s\n" $stdout_diff $tailz
  echo
  diff -wB   $output$i $input$i$o
  let num_fails=$num_fails+$?



done



echo ""
echo $num_fails" failure(s) found."
if [ $num_fails -eq 0 ] ; then
    rm -rf myOut*
    echo "ALL DIFF TESTING PASSED! Good Job :D"
fi
echo ""
