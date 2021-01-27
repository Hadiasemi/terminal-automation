# STDIN/OUT Testing Params
stdin="in"
my="my_out"
inst="out" 

# Courtesy Message Params
msg="Diff Testing with Test "
stdout_diff="STDOUT DIFF"
fileio_diff="FILEIO DIFF"
long_tailz=" ---------------------------------------- "
tailz=" --- "

# File I/O Testing Params
filename="quakes"
my_name="my_quakesFinal"
refernece_name="quakesFinal"
fileext=".txt"


num_fails=0

echo ""
echo "Copying over instructor tests (tests 0 through 2) ..."
cp ~graderjw/www/101/Projects/p5/difftests/* .
echo "Complete"

for i in `seq $1 $2`;
do                 
    echo ""
    echo $msg$i$long_tailz
    echo ""

    # copy input file and run student code with I/O redirection
    echo "Copying the contents of "$filename$i$fileext" to "$filename$fileext
    cp $filename$i$fileext $filename$fileext
    python3 quakes.py < $stdin$i > $my$i$fileext

    # run STDOUT diff
    printf "\n%s %s %s\n" $stdout_diff $tailz
    diff -wB $3 $4 $inst$i$fileext $my$i$fileext
    let num_fails=$num_fails+$?

    # run File I/O diff
    printf "\n%s %s %s\n" $fileio_diff $tailz
    diff -wB $3 $4 $refernece_name$i$fileext $filename$fileext 
    let num_fails=$num_fails+$?

    echo ""

    # write the resulting file to a copy
    echo "Saving "$filename$fileext" as "$my_name$i$fileext
    cp $filename$fileext $my_name$i$fileext

    # restore the original input file
    echo "Restoring "$filename$fileext" with the contents of "$filename$i$fileext
    cp $filename$i$fileext $filename$fileext
done

echo ""
echo $num_fails" failure(s) found."
if [ $num_fails -eq 0 ] ; then
    echo "ALL DIFF TESTING PASSED! Good Job :D"
fi
echo ""
