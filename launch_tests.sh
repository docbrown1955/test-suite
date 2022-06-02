#!/bin/bash

true=1
false=0

exit_if_failed()
{
    if [ $? != 0 ]
    then
        exit 1
    fi
}

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
make -j 2 $flags_make all


./test_procedure.sh bin/FItests.x           1
exit_if_failed
./test_procedure.sh bin/testZmumu.x         5
exit_if_failed
./test_procedure.sh bin/reinterpretation.x  10
exit_if_failed
./test_procedure.sh bin/testConjugation.x   10
exit_if_failed
./test_procedure.sh bin/testWidths.x        20
exit_if_failed
./test_procedure.sh bin/testEWGauge.x       30
exit_if_failed
./test_procedure.sh bin/testMajoranaLoop.x  25
exit_if_failed
./test_procedure.sh bin/gm2SM.x             8
exit_if_failed
./test_procedure.sh bin/C7_SM.x             15
exit_if_failed
./test_procedure.sh bin/C8_SM.x             15
exit_if_failed
./test_procedure.sh bin/sampleC9.x          50
exit_if_failed
./test_procedure.sh bin/BsMixingSM.x        20
exit_if_failed
./test_procedure.sh bin/testGTHDM.x         30
exit_if_failed
./test_procedure.sh bin/C8_PMSSM.x          75
exit_if_failed
./test_procedure.sh bin/C7_PMSSM.x          90
exit_if_failed
./test_procedure.sh bin/gm2PMSSM.x          80
exit_if_failed
./test_procedure.sh bin/sampleC9MSSM.x      350
exit_if_failed

### Termination tests
./test_procedure.sh bin/Bgenesis.x          9
exit_if_failed
./test_procedure.sh bin/SM_2IDM.x           15
exit_if_failed
./test_procedure.sh bin/NLepto.x            25
exit_if_failed
./test_procedure.sh bin/SM_triplet.x        150
exit_if_failed

### ~30min long VLQ calculations
cd testlibraries/vectorlike; ../../test_procedure.sh "./B0_mixing_VLQ.sh testlib NoBoson" 2400
exit_if_failed
