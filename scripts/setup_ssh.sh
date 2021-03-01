#!/usr/bin/env bash

# Check for ssh config.
if ! grep -q 'Host va.gov-cms-vm' ~/.ssh/config; then
  vagrant ssh-config --host va.gov-cms-vm >> ~/.ssh/config
fi

