#!/bin/bash

if [ -n "$EXTRA_PACKAGES" ] ; then
   yum install -y $EXTRA_PACKAGES
fi

groupadd -g $USERGID engr 
useradd -d $HOME -M -u $USERID -g $USERGID $USERNAME
echo "$USERNAME  ALL=(ALL)       NOPASSWD: ALL" | tee -a /etc/sudoers > /dev/null
sudo usermod -a -G mock $USERNAME
if [ -e "/var/run/docker.sock" ] ; then
   DOCKERGROUP=$(stat -c "%g" /var/run/docker.sock)
   if [ "$DOCKERGROUP" != "0" ] ; then
        groupmod -g $DOCKERGROUP docker 2>/dev/null || groupadd -g $DOCKERGROUP docker
        usermod -aG docker $USERNAME
   fi
fi

echo "export MOCK_OPTS='--old-chroot'" >> /etc/bashrc
echo
echo "Welcome to fedora 30 builder"
echo
su - $USERNAME

