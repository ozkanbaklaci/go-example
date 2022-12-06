#!/bin/bash
 

export GOPATH=$PWD/go-example
export PATH=$PWD/go-example/bin:$PATH
 
cd go-example

echo
echo "Building..."
go build -v
