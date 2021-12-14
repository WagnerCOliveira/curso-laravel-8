#!/bin/bash

mkdir -p /root/.ssh
ssh-keygen -t rsa -b 4096 -N '' -f /root/.ssh/id_rsa
chmod 400 /root/.ssh/id_rsa*
cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys

if [ "$(swapon -v)" == "" ]; then
  dd if=/dev/zero of=/swapfile bs=1M count=512
  chmod 0600 /swapfile
  mkswap /swapfile
  swapon /swapfile
  echo '/swapfile       swap    swap    defaults        0       0' >> /etc/fstab
fi
