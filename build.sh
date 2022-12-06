#!/bin/bash

export GOPATH=$PWD/go-example
export PATH=$PWD/go-example/bin:$PATH
cd go-example

echo "Building..."
go build -o golangapp
