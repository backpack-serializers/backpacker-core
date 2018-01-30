#!/bin/sh
echo "Removing old backpack.proto file..."
rm -rf backpack.proto

out="syntax = \"proto3\";"
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
        out=$out"\n   $1 $2"$i" = "$position";"
        incrementPosition
    done
}

createProtoRows bool boolean
createProtoRows string string
createProtoRows double double
createProtoRows float float
createProtoRows int32 integer
createProtoRows int64 long

out=$out"\n}"

echo $out >> backpack.proto
echo "Proto file generated!"
