#Download base image ubuntu 20.04
FROM ubuntu:20.04

# LABEL about the custom image
LABEL maintainer="broeserl1@gmail.com"
LABEL version="0.1"
LABEL description="This is a blank dev container with ubuntu 20.04"

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# Update Ubuntu Software repository
RUN apt update --fix-missing && apt -y upgrade

# Install standard tools
RUN apt -y install build-essential rsync ssh wget git python3.8 screen vim gdb gcc g++ cmake

# Install googletest
RUN apt -y install libgtest-dev && cd /usr/src/gtest && cmake CMakeLists.txt && make && cp ./lib/libgtest*.a /usr/lib

# Install ohmyzsh + dotfiles
RUN git clone -b docker https://github.com/Broeserl/dotfiles.git && cd dotfiles && ./setup.sh

# Setup ssh
RUN ( \
    echo 'LogLevel DEBUG2'; \
    echo 'PermitRootLogin yes'; \
    echo 'PasswordAuthentication yes'; \
    echo 'Subsystem sftp /usr/lib/openssh/sftp-server'; \
  ) > /etc/ssh/sshd_config_test_clion \
  && mkdir /run/sshd

# Add user to make it accessable via SSH
RUN echo 'root:root' | chpasswd

CMD ["/usr/sbin/sshd", "-D", "-e", "-f", "/etc/ssh/sshd_config_test_clion"]

# Install dependencies
#RUN apt -y install 
