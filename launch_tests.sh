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

./test_procedure.sh bin/FItests.x           1
./test_procedure.sh bin/testZmumu.x         5 
./test_procedure.sh bin/reinterpretation.x  10
./test_procedure.sh bin/testConjugation.x   10
./test_procedure.sh bin/testWidths.x        20 
./test_procedure.sh bin/testEWGauge.x       30 
./test_procedure.sh bin/testMajoranaLoop.x  25
./test_procedure.sh bin/gm2SM.x             8
./test_procedure.sh bin/C7_SM.x             15
./test_procedure.sh bin/C8_SM.x             15
./test_procedure.sh bin/sampleC9.x          50
./test_procedure.sh bin/BsMixingSM.x        20
./test_procedure.sh bin/C8_PMSSM.x          60
./test_procedure.sh bin/C7_PMSSM.x          70
./test_procedure.sh bin/gm2PMSSM.x          80
./test_procedure.sh bin/sampleC9MSSM.x      600

### Termination tests
./test_procedure.sh bin/Bgenesis.x          9
./test_procedure.sh bin/SM_2IDM.x           10
./test_procedure.sh bin/NLepto.x            25
./test_procedure.sh bin/SM_triplet.x        150

