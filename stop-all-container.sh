#!/bin/bash

container=$(docker ps -a -q)

docker stop $container
