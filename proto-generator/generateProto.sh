#!/bin/sh
echo "Removing old backpack.proto file..."
rm -rf ../backpack.proto

out="syntax = \"proto3\";"
out=$out"\nmessage Backpack {"

positionsByType=100
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
createProtoRows bytes bytes

createProtoRows int32 integer
#createProtoRows uint32 unsignedInteger
#createProtoRows sint32 signedInteger
#createProtoRows fixed32 fixedInteger
#createProtoRows sfixed32 signedFixedInteger

createProtoRows int64 long
#createProtoRows uint64 unsignedLong
#createProtoRows sint64 signedLong
#createProtoRows fixed64 fixedLong
#createProtoRows sfixed64 signedFixedLong

out=$out"\n}"

echo $out >> ../backpack.proto
echo "Proto file generated!"
