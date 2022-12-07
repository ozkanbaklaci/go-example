#!/bin/bash

export GOPATH=$PWD/gopath
export PATH=$PWD/gopath/bin:$PATH
cd go-example

echo "Starting Test..."
go test

echo "Completed Test"
