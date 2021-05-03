# Docker Development Environment

## Description
This repository provides an example of an docker container, which is used as development environment. \
The advantages are:
- All dependencies are only installed inside the container \
-> No need to "pollute" your main system with all libraries/packages
- Easy setup of complete dev env wherever you want
- Accessable through SSH \
-> Perfect for usage as a remote build target (e.g. CLion,...)
- Includes my personal dotfiles & machine setup (ohmyzsh, screen, vim, git, ...)
- Easy adaptable, e.g. just add the additionally needed packages

## Usage
1. Adapt the _Dockerfile_ to your needs
2. Run _build-container.sh_ with the container name you want /
`./build-container.sh dev-env`
3. Run _run-container.sh_ with the previously given name /
`./run-container.sh dev-env`
4. Connect with SSH to the running container
`ssh -p 2222 root@127.0.0.1`
5. Credentials for login are set in the Dockerfile (default root:root)

## Files
### Dockerfile
Is an kind of recipe to build/install all the stuff you want inside your container

### build-container.sh
Script for building the container, possibility to add the container name as an variable (default _ubuntu-dev_)

### remove-all-container.sh
Script for removing all containers

### run-container.sh
Script for running a container, possibility to add the container name as variable (default _ubuntu-dev_)

### stop-all-container.sh
Script for stopping all containers
