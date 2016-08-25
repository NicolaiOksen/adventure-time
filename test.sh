#!/bin/bash

testsPassed=0
function testString {
    if [ ! -f $2 ]; then
        echo "File $2 not found!"
        exit 2
    fi

    if eval $2  | grep -q "$3"; then
        testsPassed=$((testsPassed+1))
    else
        echo "**** Assert Failed! ****"
        echo $1
        echo "************************"
        exit 1
    fi
}

testString "Finn should say ADVENTURE AWESOME TIME" ./finn.sh 'ADVENTURE AWESOME TIME'
testString "Jake should say Mathemagical" ./jake.sh 'Mathemagical'
testString "He-man should say Yeeeehaaaaw" ./heman.sh 'Yeeeehaaaaw'

echo "$testsPassed unit tests passed"
echo "SUCCESS" 

