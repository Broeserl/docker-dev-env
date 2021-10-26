#!/bin/bash

name=ubuntu-dev

if [ $# -eq 1 ]
  then
    name="$1"
fi

docker run -d --cap-add sys_ptrace -p 127.0.0.1:2222:22 --name $name $name 

ssh-keygen -f "$HOME/.ssh/known_hosts" -R "[127.0.0.1]:2222"
