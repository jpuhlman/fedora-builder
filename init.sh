#!/bin/bash

groupadd -g $USERGID engr 
useradd -d $HOME -M -u $USERID -g $USERGID $USERNAME
echo "$USERNAME  ALL=(ALL)       NOPASSWD: ALL" | tee -a /etc/sudoers > /dev/null
sudo usermod -a -G mock $USERNAME
echo "export MOCK_OPTS='--old-chroot'" >> /etc/bashrc
echo
echo "Welcome to fedora 30 builder"
echo
su - $USERNAME

