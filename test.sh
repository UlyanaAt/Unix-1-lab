#! /usr/bin/bash

directoryName=`mktemp -d authentic+XXXXXX`
mv $1 $directoryName
cd $directoryName
fileName=`awk '/\/\/Output:/{print $2}' $1`
g++ -Wall -o $fileName $1
./$fileName
mv $1 ../
mv $fileName ../
cd ../
rmdir $directoryName

