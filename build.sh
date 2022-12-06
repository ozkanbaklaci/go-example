#!/bin/bash
 

export GOPATH=$PWD/golangapp
export PATH=$PWD/golangapp/bin:$PATH
 
cd go-example

echo
echo "Building..."
go build -v
