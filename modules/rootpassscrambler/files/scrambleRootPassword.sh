#!/bin/bash

# Scramble root password

echo "Scramble Time"
PASSWD=$(cat /dev/urandom|tr -dc "a-zA-Z0-9-_"|fold -w 30|head -n 1)
echo -ne "${PASSWD}\n${PASSWD}" | /usr/bin/passwd root
echo "Root password scrambled: ${PASSWD}"
