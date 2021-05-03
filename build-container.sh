#!/bin/bash

name=ubuntu-dev

if [ $# -eq 1 ]
  then
    name="$1"
fi

docker build -t $name .
