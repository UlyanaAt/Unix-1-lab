#! /usr/bin/bash

if [ "$#" -lt 1 ]; then
    echo "You didn't enter file name. Example: helloW.cpp"
    exit 1
fi
directoryName=`mktemp -d authentic+XXXXXX`
mv $1 $directoryName
cd $directoryName
fileName=`awk '/\/\/Output:/{print $2}' $1`
if [ -z $fileName ]; then
    echo "Your file doesn't contain the output file name"
    mv $1 ../
    cd ../
    rmdir $directoryName
    exit 1
fi
g++ -Wall -o $fileName $1
./$fileName
mv $1 ../
mv $fileName ../
cd ../
rmdir $directoryName

