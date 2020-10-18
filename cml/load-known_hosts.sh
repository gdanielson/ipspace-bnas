#!/bin/bash

JUMPHOST=10.208.253.102

sed -iE '/^10\.208\.253\.102/d' ~/.ssh/known_hosts && \
ssh-keyscan -trsa ${JUMPHOST} >>~/.ssh/known_hosts

for i in $(seq 2 5); do
    sed -iE "/^192\.168\.1\.${i}/d" ~/.ssh/known_hosts && \
    ssh ubuntu@${JUMPHOST} "ssh-keyscan -trsa 192.168.1.${i}" >> ~/.ssh/known_hosts
done
