#!/bin/bash

USERNAME="ansible-test"

sudo userdel --force --remove $USERNAME

sudo expect << EOF
  spawn adduser --gecos "" $USERNAME
  expect "Enter new UNIX password:"
  send "$(pass ansible-test-user)\r"
  expect "Retype new UNIX password:"
  send "$(pass ansible-test-user)\r"
  expect eof
EOF

sudo usermod -aG sudo $USERNAME

expect << EOF
  spawn ssh-copy-id $USERNAME@localhost
  expect "ansible-test@localhost's password:"
  send "$(pass ansible-test-user)\r"
  expect eof
EOF
