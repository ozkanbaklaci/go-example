#!/bin/bash

export GOPATH=$PWD/gopath
export PATH=$PWD/gopath/bin:$PATH
cd go-example

echo "Building..."
go build -o golangapp
