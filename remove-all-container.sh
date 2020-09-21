#!/bin/bash

container=$(docker ps -a -q)

docker rm $container
