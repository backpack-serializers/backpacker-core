#!/bin/sh
echo "Removing old backpack.proto file..."
rm -rf BackpackMessage.proto

out="syntax = \"proto3\";"
out=$out"\npackage com.github.backpacker;"
out=$out"\nmessage BackpackMessage {"

positionsByType=20
position=1

incrementPosition(){
    position=`expr $position + 1`
}

createProtoRows(){
    echo "Creating rows of type $1..."
    for i in `seq 1 $positionsByType`
    do
        out=$out"\n   $1 $2$i = $position;"
        incrementPosition
    done
}

positionsByType=40
createProtoRows string string
positionsByType=20
createProtoRows bool boolean
createProtoRows double double
createProtoRows float float
createProtoRows int32 integer
createProtoRows int64 long

out=$out"\n}"


out=$out"\n\nmessage BackpackMessagesList {"
out=$out"\n repeated bytes list = 1;"
out=$out"\n}"

echo $out >> BackpackMessage.proto
echo "Proto file generated!"
