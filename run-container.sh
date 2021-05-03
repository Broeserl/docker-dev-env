#!/bin/bash

name=ubuntu-dev

if [ $# -eq 1 ]
  then
    name="$1"
fi

docker run -d --cap-add sys_ptrace -p127.0.0.1:2222:22 --name $name $name 

ssh-keygen -f "$HOME/.ssh/known_hosts" -R "[localhost]:2222"
