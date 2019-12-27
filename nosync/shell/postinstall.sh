#!/bin/bash

sed -i "65s/PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
