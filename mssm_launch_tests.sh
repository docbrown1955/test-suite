#!/bin/bash

true=1
false=0

clean=$false
print=$false
while [ $# -ge 1 ]
do
    if [ "$1" == "-c" ]
    then
        clean=$true
    #elif [ "$1" == "-v" ]
    #then
    #    print=$true
    fi
    shift
done

if [ "$clean" == "$true" ]
then
    clean_make="make clean"
fi

if [ "$print" == "$true" ]
then
    flags_make="-D PRINT_PROG"
fi

#cd ../../csl  ; $clean_make; make -j 8 all && make install
#cd ../marty; $clean_make; make -j 8 lib && make install
#cd ../tests/systemTests
make -j 8 $flags_make all

./test_procedure.sh bin/C8_PMSSM.x          60
./test_procedure.sh bin/C7_PMSSM.x          70
./test_procedure.sh bin/gm2PMSSM.x          80
./test_procedure.sh bin/sampleC9MSSM.x      600
