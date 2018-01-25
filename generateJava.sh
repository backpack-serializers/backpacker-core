#!/bin/sh
protobuffers-compiler-v3.5.1/protoc-3.5.1-osx-x86_64/bin/protoc --java_out="java" "backpack.proto"
cp java/BackpackOuterClass.java ../kotlin/src/BackpackOuterClass.java
