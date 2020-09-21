#Download base image ubuntu 20.04
FROM ubuntu:20.04

# LABEL about the custom image
LABEL maintainer="broeserl1@gmail.com"
LABEL version="0.1"
LABEL description="This is a blank dev container with ubuntu 20.04"

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# Update Ubuntu Software repository
RUN apt update --fix-missing

# Install standard tools
RUN apt -y install build-essential ssh wget git python3.8 screen vim gdb gcc g++ cmake

# Install dependencies
#RUN apt -y install 

# Copy config files
COPY config/.vimrc /root/.vimrc
COPY config/.screenrc /root/.screenrc
COPY config/.aliases /root/.aliases
COPY config/.jo_config /root/.jo_config
COPY config/.gitconfig /root/.gitconfig
RUN echo "source /root/.jo_config" >> /root/.bashrc

# Setup ssh
RUN ( \
    echo 'LogLevel DEBUG2'; \
    echo 'PermitRootLogin yes'; \
    echo 'PasswordAuthentication yes'; \
    echo 'Subsystem sftp /usr/lib/openssh/sftp-server'; \
  ) > /etc/ssh/sshd_config_test_clion \
  && mkdir /run/sshd

# Add user to make it accessable via SSH
#RUN useradd -m user && yes password | passwd user && adduser user sudo
RUN echo 'root:password' | chpasswd

CMD ["/usr/sbin/sshd", "-D", "-e", "-f", "/etc/ssh/sshd_config_test_clion"]
