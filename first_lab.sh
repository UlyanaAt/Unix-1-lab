#! /usr/bin/bash

function delTempDir {
#moving a source and output files to a upper directory
mv $sourceFile ../
mv $fileName ../

#moving to a upper directory
cd ../

#deleting temporary directory
rmdir $directoryName

echo "Temporary directory was deleted"
exit 1
}

#Trapping signals
trap delTempDir SIGQUIT SIGTERM SIGINT

if [ "$#" -lt 1 ]; then
    echo "You didn't enter file name. Example: helloW.cpp"
    exit 1
fi

sourceFile=$1

#creation of the temporary directory 
directoryName=`mktemp -d authentic+XXXXXX`

#moving the source file to a temporary directory
mv $1 $directoryName

#moving to a temporary directory
cd $directoryName

#finding the output file name in the source file
fileName=`awk '/\/\/Output:/{print $2}' $1`

if [ -z $fileName ]; then
    echo "Your file doesn't contain the output file name"
    mv $1 ../
    cd ../
    rmdir $directoryName
    exit 1
fi

#source file compilation
g++ -Wall -o $fileName $1

#output file execution
./$fileName

delTempDir
