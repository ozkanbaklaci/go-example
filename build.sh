#!/bin/bash
 
set -e -u -x
 
export GOPATH=$PWD/gopath
export PATH=$PWD/gopath/bin:$PATH
 
cd golangExample

echo
echo "Building..."
go build -v