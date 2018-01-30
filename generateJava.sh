#!/bin/sh

protobuffers-compiler-v3.5.1/protoc-3.5.1-osx-x86_64/bin/protoc --java_out="java" "BackpackMessage.proto"

cp java/com/github/backpacker/BackpackMessageOuterClass.java ../kotlin/src/main/java/com/github/backpacker/BackpackMessageOuterClass.java
